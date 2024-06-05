# Brain Tumor Classification Using Bag of Features
This repository contains code and resources for classifying brain tumors using a Bag of Features (BoF) approach. This repo is serves as production code for the paper "Brain tumour classification using BoF-SURF with filter-based feature selection methods" which is published on "Multimedia Tools and Applications."

If you use any resources except the dataset in this repository, please cite the following paper:
* [1] Mohammed ZF, Mussa DJ. [Brain tumour classification using BoF-SURF with filter-based feature selection methods](https://link.springer.com/article/10.1007/s11042-024-18171-6). Multimed Tools Appl. (2024). doi:  10.1007/s11042-024-18171-6.

## Dataset
The dataset utilized in this repo taken from [Brain Tumor Detection Dataset (CE-MRI)](https://figshare.com/articles/dataset/brain_tumor_dataset/1512427) is structured into three directories within the Dataset folder:

Dataset/1: Meningioma (708 slices)
Dataset/2: Glioma (1426 slices)
Dataset/3: Pituitary Tumor (930 slices)

## Feature Extraction
We use the imageSet function to load the images, and the bagOfFeatures function to create a bag of visual words from the images. The bag of features is created with the following parameters:

Number of Clusters (Visual Words): 500
Proportion of Strong Features: 0.8
The extracted features are stored in an Excel file (BoF-Surf500_All.xlsx).

## Feature Selection
Five different feature selection methods are applied to select the most relevant features:

ReliefF
ANOVA
Kruskal
MRMR (Minimum Redundancy Maximum Relevance)
CHI2 (Chi-square)

## Classification
The selected features are used to train and test machine learning models using 5-fold cross-validation. This ensures robust performance evaluation of the models.

### Usage
Load the dataset: The dataset should be placed in the Dataset folder.
Extract features: Run the feature extraction script to generate the bag of features.
Process Image Sets: Call the processImageSet function for each image set to extract and save feature vectors.
Feature Selection and Classification: Apply feature selection methods and perform 5-fold cross-validation to train and evaluate machine learning models.

### Dependencies
MATLAB with Image Processing Toolbox
Excel for saving the feature vectors

## Results
The results of the classification, including the performance of different models, will be stored and can be analyzed to select the best-performing model for deployment.
