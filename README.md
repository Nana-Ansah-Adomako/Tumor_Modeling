# Tumor Growth Modelling in R

## Overview

This project models **tumor growth over time** using nonlinear regression in R. The analysis compares two commonly used mathematical growth models:

* **Exponential growth model**
* **Gompertz growth model**

The objective is to preprocess tumor growth data, identify and remove extreme observations, fit mathematical growth models, and visualize how well each model describes the observed tumor-volume trajectory.

This project demonstrates the application of **nonlinear modelling and quantitative analysis** to biological growth data.

---

## Dataset

The analysis uses the `TUMspher.txt` dataset.

The dataset contains measurements of tumor growth over time, including:

* **Day** – time point of measurement
* **Tumor ID** – identifier for the tumor
* **Log tumor volume** – logarithmically transformed tumor volume

The original tumor volume is recovered using the exponential transformation:

```r
tumvol = exp(tumdata[,4])
```

---

## Data Preprocessing

The dataset is first imported into R and transformed into a format suitable for modelling.

A subset containing **day, tumor volume, and tumor ID** is created, with tumor ID converted to a categorical variable.

The initial tumor growth pattern is visualized using:

```r
plot(day, tumvol)
```

### Outlier Removal

Extreme observations with tumor volumes greater than **1200** are identified and removed:

```r
yout = tumvol > 1200
```

The cleaned dataset is then used for subsequent modelling.

The purpose of this step is to prevent extreme observations from disproportionately influencing the nonlinear growth models.

---

## Tumor Growth Models

### 1. Exponential Growth Model

The first model assumes that tumor volume increases exponentially over time.

The model is fitted using nonlinear least squares:

```r
model1 = nlsfit(
  mydata,
  model = 6,
  start = c(a = 200, b = 0.1)
)
```

The fitted model is visualized alongside the observed tumor volumes:

```r
nlsplot(
  mydata,
  model = 6,
  start = c(a = 200, b = 0.1),
  xlab = "Days",
  ylab = "Tumor Volume",
  position = 1
)
```

---

### 2. Gompertz Growth Model

The second model uses the **Gompertz growth model**, which is useful for biological growth processes where growth initially accelerates but subsequently slows as the system approaches a limiting size.

The model is fitted using:

```r
model2 = nlsfit(
  mydata,
  model = 10,
  start = c(a = 200, b = 2, c = 0.1)
)
```

The fitted Gompertz curve is then visualized:

```r
nlsplot(
  mydata,
  model = 10,
  start = c(a = 200, b = 2, c = 0.1),
  xlab = "Days",
  ylab = "Tumor Volume",
  position = 1
)
```

---

## Analysis Workflow

```text
Raw Tumor Data
      ↓
Data Import
      ↓
Transform Log Tumor Volume
      ↓
Exploratory Visualization
      ↓
Identify Extreme Tumor Volumes
      ↓
Remove Outliers
      ↓
Fit Exponential Model
      ↓
Fit Gompertz Model
      ↓
Visualize Model Fits
      ↓
Compare Growth Behaviour
```

## Key Concepts

This project demonstrates:

* **Nonlinear regression**
* **Biological growth modelling**
* **Exponential growth**
* **Gompertz growth**
* **Data transformation**
* **Outlier detection and removal**
* **Exploratory data analysis**
* **Model fitting and visualization**
* **Parameter estimation**
* **Mathematical modelling of tumor dynamics**

## Tools & Technologies

* **R**
* `easynls`
* Nonlinear Least Squares (`nls`)
* Data visualization using base R

## Project Goal

The broader goal is to use mathematical models to describe **tumor growth dynamics** and determine which growth model provides a more appropriate representation of the observed biological data.

The project provides a foundation for using quantitative models to understand tumor progression and can be extended to include **model comparison, parameter interpretation, prediction of future tumor volume, and evaluation of treatment effects**.
