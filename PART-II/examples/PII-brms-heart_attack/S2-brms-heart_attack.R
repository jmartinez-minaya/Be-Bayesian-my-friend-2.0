# Load necessary libraries
library(brms)
library(readxl)
library(dplyr)
library(ggplot2)

# Load data
data_hattack <- readxl::read_xlsx("heartattack.xlsx")

# Convert variables to factors
data_hattack <- data_hattack %>%
  mutate(
    sbp140 = as.factor(sbp140),
    age60 = as.factor(age60)
  )

# Specify the model in brms
# The logistic regression model with MI as the response variable
# and age60 and sbp140 as predictors.
formula <- bf(y ~ 1 + age60 + sbp140, family = bernoulli())

# Define the priors
priors <- c(
  brms::prior(normal(0, sqrt(1000)), class = "b", coef = "age60>EQ60"),
  brms::prior(normal(0, sqrt(1000)), class = "b", coef = "sbp140>EQ140"),
  brms::prior(normal(0, sqrt(1000)), class = "Intercept")  # Prior for the intercept
)

# Fit the model using brms
fit_brms <- brm(formula,
    data = data_hattack,
    prior = priors,
    chains = 3,      # Number of MCMC chains
    iter = 5000,     # Total number of iterations per chain
    warmup = 1000,   # Number of iterations for warm-up
    thin = 5,        # Thinning interval
    seed = 123,      # Seed for reproducibility
  )


# Summary of the fitted model
summary(fit_brms)

plot(fit_brms)

# Extract posterior samples
posterior_samples <- as_draws_df(fit_brms) %>% 
  dplyr::select(starts_with("b_age60>EQ60"), starts_with("b_sbp140>EQ140"))
names(posterior_samples) <- c("b_age60", "b_sbp140")

# Calculate odds ratios for age60 and sbp140
posterior_samples <- posterior_samples %>%
  mutate(
    odds_ratio_age60 = exp(b_age60),
    odds_ratio_sbp140 = exp(b_sbp140)
  )

# Summarize odds ratios
summary_odds_ratios <- posterior_samples %>%
  summarise(
    median_age60 = median(odds_ratio_age60),
    mean_age60 = mean(odds_ratio_age60),
    sd_age60 = sd(odds_ratio_age60),
    lower95_age60 = quantile(odds_ratio_age60, 0.025),
    upper95_age60 = quantile(odds_ratio_age60, 0.975),
    median_sbp140 = median(odds_ratio_sbp140),
    mean_sbp140 = mean(odds_ratio_sbp140),
    sd_sbp140 = sd(odds_ratio_sbp140),
    lower95_sbp140 = quantile(odds_ratio_sbp140, 0.025),
    upper95_sbp140 = quantile(odds_ratio_sbp140, 0.975)
  )

print(summary_odds_ratios)

# Plot posterior densities of odds ratios using ggplot2
posterior_samples_long <- posterior_samples %>%
  tidyr::pivot_longer(cols = c("odds_ratio_age60", "odds_ratio_sbp140"),
               names_to = "parameter", values_to = "odds_ratio")

# Plot density
ggplot(posterior_samples_long, aes(x = odds_ratio, fill = parameter)) +
  geom_density(alpha = 0.5) +
  labs(title = "Posterior Density of Odds Ratios",
       x = "Odds Ratio",
       y = "Density",
       fill = "Parameter") +
  theme_minimal()

# Predict the probability of MI for new individuals
new_data <- tibble(
  age60 = factor(c("<60", ">=60", "<60", ">=60"), levels = c("<60", ">=60")),
  sbp140 = factor(c("<140", ">=140", ">=140", "<140"), levels = c("<140", ">=140"))
)

# Generate predictions
predictions <- posterior_epred(fit_brms, newdata = new_data)

# Summarize predictions for each individual
prediction_summary <- apply(predictions, 2, function(x) {
  c(mean = mean(x), lower95 = quantile(x, 0.025), upper95 = quantile(x, 0.975))
}) %>%
  t() %>%
  as.data.frame()

# Print prediction summaries for the new individuals
rownames(prediction_summary) <- c("Individual 1", "Individual 2", "Individual 3", "Individual 4")
print(prediction_summary)
