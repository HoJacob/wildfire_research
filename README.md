# 🌲 Wildfire Ignition Probability Prediction (R)

This repository implements **Random Forest machine learning models** to estimate the **probability of wildfire ignition** using regional climate data across two major study regions:

* **Colorado Front Range**
* **California Sierra Nevada**

Each model processes multi-year climate predictors and outputs ignition probability metrics that can help evaluate the environmental conditions most conducive to wildfires.
The repository also contains supporting scripts for data preprocessing, vegetation filtering, and exploratory visualization.

While many research-related sections are included, this project’s main goal is to feature and demonstrate the **Random Forest ML component**, so certain data-prep or plotting sections are not intended to be executed in full.

---

## 📚 Required Libraries

Core R packages used across the scripts (each script contains its own header of necessary libraries to be run):

```r
install.packages(c(
  "randomForest", "tidyverse", "sqldf", "plotly",
  "ncdf4", "raster", "sf", "here"
))
```

These libraries handle data wrangling, spatial operations, netCDF raster manipulation, and Random Forest classification.

---

## 🧠 Project Overview

The objective of this project is to:

> Build and train Random Forest models that estimate the **probability of wildfire ignition** from climate and drought indicator datasets.

### Predictors include:

For Front Range Fires:
* **VS (Wind Speed)**
* **VPD (Vapor Pressure Deficit)**
* **FM100 / FM1000 (Fuel Moisture Levels)**
* **PDSI, SPI, SPEI (Drought Indices)**
* **SPH (Specific Humidity)**
* **TMMN / TMMX (Min and Max Temperature)**

For Sierra Nevada Fires (drought indicator datasets not yet implemented):
* **VS (Wind Speed)**
* **VPD (Vapor Pressure Deficit)**
* **FM100 / FM1000 (Fuel Moisture Levels)**
* **SPH (Specific Humidity)**
* **TMMN / TMMX (Min and Max Temperature)**

The project is structured into two main regional pipelines — each independently processes datasets and fits Random Forest models tuned for its geographic area.

---

## 📁 Repository Structure

```
Wildfire Research/
├── Front Range Fires/
│   ├── data/                     # Regional CSV datasets and predictors
│   ├── FirePredictionRF.R        # Random Forest training, testing, and model output
│   ├── FireStoreIndexOG.R        # Builds ignition indices from fire occurrence data
│   ├── mtbs_perimeter_data/      # Shapefiles of spatial fire perimeter data
│   ├── plotting/                 # Visualization scripts (fire-climate plots, diagnostics)
│   ├── read.R                    # Reads and merges climate predictor datasets
│   └── RFTesting/                # Experimental or parameter tuning code
│
└── Sierra Nevada Fires/
    ├── BurnAcres_TS.csv          # Burned area time series reference
    ├── cali_data/                # Region-specific predictor datasets
    ├── vegGrids/                 # NetCDF vegetation classification grids
    ├── mtbs_perimeter_data8424/  # Sierra Nevada MTBS perimeter shapefile data
    ├── ReadInVegFilters.R        # Vegetation filtering and preprocessing script
    ├── FireStoreIndexCali.R      # Index generation and Sierra Nevada fire subsetting
    ├── caliReadDF.R              # Reads and aligns climate data for California Sierra Nevada
    └── CaliFirePredictionRF.R    # Random Forest model training, validation, and results
```

---

## ⚙️ Running the Pipelines

Below are simplified instructions for running the **machine learning pipelines** only.

---

### 🔹 **Front Range Fires**

1. Open and run **`FireStoreIndex.R`**
   → Generates ignition indices and date filters.

2. Run **`read.R`**
   → Reads, cleans, and merges climate predictor CSVs.

3. Run **`FirePredictionRF.R`**
   → Trains Random Forest model and outputs ignition probability predictions, confusion matrix, and feature importance metrics.

---

### 🔹 **Sierra Nevada Fires**

1. In **`ReadInVegFilters.R`**, run only the **“Run only”** section to prepare vegetation layers.

2. In **`FireStoreIndexCali.R`**:
   * Run vegetation grid sections for **CA1**, **CA2**, and **CA3**
   * Run **Combine Fire Indices**
   * Subset to **Sierra Nevada fires only**
   * Apply trimming via **Apply index to trim**
   * Output ignition dates through **getting out dates and fires**
   
3. Run **all of `caliReadDF.R`**

4. In **`CaliFirePredictionRF.R`**:
   * Run both **setup sections**
   * Then execute any desired sections such as:
     * k-fold cross-validation
     * Top predictor analysis
     * Additional analytical visualizations

---

## 🧹 Notes and Best Practices

* Some exploratory and data-filtering sections are **not meant to be executed** unless performing full data replication.
  For ML demonstrations, follow only the core scripts above.
* Use the `here()` library to handle file paths consistently — this ensures your code runs regardless of working directory.

---

## 📊 Output Overview

Each pipeline aims to produce:

* Ignition probability predictions per day or grid cell
* Variable importance plots (top predictors)
* Cross-validation summaries
* Model accuracy visualizations

---

## 📦 IMPORTANT Data Availability IMPORTANT

Due to GitHub’s file size limitations, large spatial datasets (such as MTBS shapefiles and raw climate grids) have been excluded from version control.
All analysis scripts, model pipelines, and example data structures are included here for full reproducibility.
Complete datasets are needed for functional execution of code and can be shared upon request for research or evaluation purposes.

---

## 🗾 Acknowledgments

Developed under mentorship from Dr. Ronnie Abolafia-Rosenzweig at the **National Center for Atmospheric Research (NCAR)**
and inspired by ongoing research toward **early-warning wildfire systems** in the Western United States.

---

## 🧭 Author

**Jacob Ho**
University of Wisconsin–Madison
B.S. Computer Science, Class of 2028
Project: Wildfire Ignition Probability Modeling
