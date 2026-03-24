# Be Bayesian my Friend 2.0.

Welcome to the course **Be Bayesian my Friend 2.0.**, a continuation of the short course  
[**Be Bayesian, My Friend**](https://github.com/jmartinez-minaya/Be-Bayesian-my-friend).

This is a **20-hour course** designed to provide a comprehensive introduction to **Bayesian inference**, from foundational concepts to modern methodologies such as **MCMC**, **JAGS**, **stan**, **brms**, **INLA** and **inlabru**, including **hierarchical** and **spatial models**.  

The course combines theory and practice, with real-world examples and hands-on implementations in **R**.
---

## 🧠 Course Overview

The course is structured in **four main parts**, covering the full Bayesian workflow: from probabilistic reasoning to advanced modeling.

## Part I: Foundations of Bayesian Inference (5h)

- Motivation and real-world problems  
- Bayesian paradigm: prior, likelihood, posterior  
- Bayesian updating  
- Conjugate models (Beta–Binomial)  
- Predictive distributions  

---

## Part II: Bayesian Computation (5h)

- Monte Carlo methods  
- MCMC (Metropolis–Hastings)  
- Bayesian software (JAGS, Stan, brms)  

---

## Part III: INLA and Latent Gaussian Models (5h)

- Hierarchical models and mixed effects  
- Latent Gaussian models  
- INLA methodology and implementation  
- Model selection (DIC, WAIC)  

---

## Part IV: Spatial Statistics (5h)

- Types of spatial data  
- Disease mapping  
- Geostatistics  
- Gaussian fields and spatial dependence  
- SPDE approach with INLA  
- PC priors  


---

## 💻 Software Requirements

To follow the practical sessions, please ensure that the following software is installed:

- [R (version 4.5.1 or later)](https://cran.r-project.org/)  
- [RStudio](https://posit.co/download/rstudio-desktop/) or  
- [Quarto](https://quarto.org/docs/get-started/) or  
- [Visual Studio Code](https://code.visualstudio.com/download)  
- [JAGS](https://mcmc-jags.sourceforge.io/)  

> ⚠️ Some examples rely on external software such as JAGS.

### **INLA Installation**

The examples use the **INLA** package version:

```
This is INLA_25.06.07 built 2025-06-11 18:54:45 UTC; unix.
- See www.r-inla.org/contact-us for how to get help.
- List available models/likelihoods/etc with inla.list.models()
- Use inla.doc(<NAME>) to access documentation
- Consider upgrading R-INLA to testing[25.10.28] or stable[25.10.19]
```

You can install it directly from the official INLA repository:

```r
install.packages("INLA", repos = c(getOption("repos"), INLA = "https://inla.r-inla-download.org/R/stable"))
```

For more information, visit the official installation guide:  
🔗 [https://www.r-inla.org/download-install](https://www.r-inla.org/download-install)

---

## 📦 R Packages

Install the required packages with:

```r
install.packages(c(
  "INLA", "inlabru", "Matrix", "sp", "sf", "spdep",
  "tmap", "raster", "terra", "ggplot2", "dplyr",
  "readxl", "kableExtra", "runjags", "brms",
  "viridis", "RColorBrewer", "gridExtra",
  "patchwork", "leaflet", "ggthemes", "rnaturalearth"
))
```

> Additional dependencies (Bioconductor)

```r
BiocManager::install(c("graph", "Rgraphviz"), dep = TRUE)
```

---


## 📁 Folder Structure

The repository is organized as follows:

```
BAYESIANLEARNING/
│
├── PART-I/
│   ├── theory/
│   │   └── PI_bayesian_inference.pdf
│   └── examples/
│       └── PI-BI_beta_binomial/
│
├── PART-II/
│   ├── theory/
│   │   └── PII_bayesian_computation.pdf
│   ├── examples/
│   └── exercises/
│       └── PII-diabetes/
│
├── PART-III/
│   ├── theory/
│   │   └── PIII_inla.pdf
│   ├── examples/
│   │   ├── PIII-INLA-KAKHI-VALENCIA/
│   │   ├── PIII-INLA-measurement_agreement_COPD/
│   │   ├── PIII-INLA-rain/
│   │   └── PIII-INLA-seeds/
│   └── exercises/
│
├── PART-IV/
│   ├── theory/
│   │   └── PIV_spatial.pdf
│   ├── examples/
│   │   ├── PIV-INLA-disease-mapping/
│   │   ├── PIV-inlabru-geostatistics/
│   │   └── PIV-inlabru-mesh/
│
└── README.md
```


---

### 📌 Notes

- **PART-I**: Foundations of Bayesian inference  
- **PART-II**: Computation and hierarchical models (MCMC)  
- **PART-III**: INLA methodology and latent Gaussian models  
- **PART-IV**: Spatial statistics and advanced models  

- **theory/** contains lecture slides (HTML/PDF)  
- **examples/** contains worked case studies  
- **exercises/** contains hands-on practice material  




## 🎯 Learning Outcomes

By the end of this course, participants will be able to:

- Understand **Bayesian reasoning** and the role of the **prior, likelihood, and posterior distributions**.  
- Build and interpret **Bayesian models** for real-world problems.  
- Implement **Bayesian inference using MCMC methods** (*JAGS*, *Stan*, and *brms*).  
- Apply **INLA** for fast approximate inference in **latent Gaussian models (LGMs)**.  
- Develop **hierarchical (mixed) models** to capture structured variability.  
- Model and interpret **spatial data** using **Bayesian approaches**.  
- Evaluate models using criteria such as **DIC** and **WAIC**.  
- Communicate results through **posterior summaries**, **predictions**, and **uncertainty quantification**.   



## 👨‍🏫 Instructor

**Joaquín Martínez-Minaya**  
Applied Statistics and Operations Research and Quality (DEIOAC)  
Universitat Politècnica de València (UPV)

📧 **Email:** [jmarmin@eio.upv.es](mailto:jmarmin@eio.upv.es)  
🌐 **Website:** [https://github.com/jmartinez-minaya](https://github.com/jmartinez-minaya)  

---

## 📚 Bibliography

1. Bachl, F. E., Lindgren, F., Borchers, D. L., & Illian, J. B. (2019). *inlabru: An R package for Bayesian spatial modelling from ecological survey data*. Methods in Ecology and Evolution, 10(6), 760–766. https://doi.org/10.1111/2041-210X.13168  

2. Blangiardo, M., & Cameletti, M. (2015). *Spatial and Spatio-temporal Bayesian Models with R-INLA*. Wiley.  

3. Broemeling, L. D. (2013). *Bayesian Methods in Epidemiology*. Chapman and Hall/CRC.  

4. Gelman, A., Carlin, J. B., Stern, H. S., Dunson, D. B., Vehtari, A., & Rubin, D. B. (2013). *Bayesian Data Analysis* (3rd ed.). Chapman and Hall/CRC.  

5. Gómez-Rubio, V. (2020). *Bayesian Inference with INLA*. CRC Press.  

6. Krainski, E., Gómez-Rubio, V., Bakka, H., Lenzi, A., Rue, H., & Lindgren, F. (2019). *Advanced Spatial Modeling with Stochastic Partial Differential Equations Using R and INLA*. Chapman and Hall/CRC.  

7. Lawson, A. B. (2018). *Bayesian Disease Mapping: Hierarchical Modeling in Spatial Epidemiology* (3rd ed.). CRC Press.  

8. Lesaffre, E., & Lawson, A. B. (2012). *Bayesian Biostatistics*. Chapman & Hall/CRC Biostatistics Series.  

9. Martínez-Beneito, M. A., & Botella-Rocamora, P. (2019). *Disease Mapping: From Foundations to Multidimensional Modeling*. CRC Press.  

10. Moraga, P. (2019). *Geospatial Health Data: Modeling and Visualization with R-INLA and Shiny*. Chapman and Hall/CRC.  

11. Moraga, P. (2021). *Handbook of Spatial Epidemiology and Disease Modeling: Applications with R*. CRC Press.  

12. Rue, H., Martino, S., & Chopin, N. (2009). *Approximate Bayesian Inference for Latent Gaussian Models by Using Integrated Nested Laplace Approximations*. Journal of the Royal Statistical Society: Series B, 71(2), 319–392.  



