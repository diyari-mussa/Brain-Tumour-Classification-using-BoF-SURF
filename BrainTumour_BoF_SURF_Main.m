% Define a cell array 'imgSets' that contains three image sets, each representing a different type of brain tumor.
% Each image set is created using the imageSet function, which is provided with the path to the corresponding directory.
% The directories are named '1', '2', and '3' and are located within the 'Dataset' folder.
% Each directory contains images of a specific type of brain tumor:
% - '1': meningioma (708 slices)
% - '2': glioma (1426 slices)
% - '3': pituitary tumor (930 slices)
imgSets = [ imageSet(fullfile('.\Dataset\', '1')), ...
            imageSet(fullfile('.\Dataset\', '2')), ...
            imageSet(fullfile('.\Dataset\', '3')) ];

% Assign the count of images in each set to variables
countSet1 = imgSets(1).Count;
countSet2 = imgSets(2).Count;
countSet3 = imgSets(3).Count;

% Number of visual words (clusters) in the bag of features which by default is 500
% In this study diffrent clusters expremented according to the propossed algorithm "Cluster Creation Stoppage"
% According to the results of that algorithm diffrent number of cluster size will be manually assigned
% For instance 500, 625, 750, .. read section 3.4.2 in chapter three.   
numberOfClusters = 500;
% Proportion of strong features to use in the bag of features which by default is 0.8
ratioOfStrongFeatures = 0.8; 

% Path to store the vector of features
path = strcat('.\BoF-Surf',num2str(numberOfClusters),'_All.xlsx');


% Create a bag of features using the image sets.
% The 'bagOfFeatures' function automatically detects and extracts features
% from the images in 'imgSets' using the default feature extraction algorithm,
% which is SURF (Speeded-Up Robust Features) unless a custom extractor is specified.
% The resulting bag contains visual words representing the features of the images.

% Parameters:
% - 'StrongestFeatures': Specify the proportion of the strongest features to use.
%                         Default is set by 'ratioOfStrongFeatures'.
% - 'VocabularySize': Specify the number of clusters (visual words) in the bag of features.
%                       Default is set by 'numberOfClusters'.
bag = bagOfFeatures(imgSets, 'StrongestFeatures', ratioOfStrongFeatures, 'VocabularySize', numberOfClusters);

% Call processImageSet function for each image set
processImageSet(1, countSet1, imgSets, bag, path);  % imgSet 1 with 708 images
processImageSet(2, countSet2, imgSets, bag, path); % imgSet 2 with 1426 images
processImageSet(3, countSet3, imgSets, bag, path);  % imgSet 3 with 930 images

% After processing images and extracting features, the resulting feature vectors
% are stored in an Excel file specified by the 'path' variable.
% These feature vectors will be used as input data for machine learning algorithms.

% Before classification, feature selection will be performed using five different
% feature selection methods, which are available as plugins in MATLAB:
% - ReliefF
% - ANOVA
% - Kruskal
% - MRMR (Minimum Redundancy Maximum Relevance)
% - CHI2 (Chi-square)
%
% Each feature selection method will select a subset of the most relevant features
% based on different statistical criteria, improving the performance and efficiency
% of the classification model by reducing the dimensionality of the feature space.

% The selected features will then be used to train and test machine learning models
% using 5-fold cross-validation. In 5-fold cross-validation, the dataset is randomly
% partitioned into five equal-sized folds. In each iteration, one fold is held out as
% the test set while the rest are used for training. This process is repeated five times,
% with each fold being used as the test set exactly once. The performance of the model
% is evaluated as the average performance across all iterations, providing a robust
% estimate of the model's performance on unseen data.
%
% Example:
% - Load the feature vectors from the Excel file.
% - Apply each feature selection method to select the most relevant features.
% - Perform 5-fold cross-validation on each feature-selected dataset.
% - Train and test machine learning models on each fold of the cross-validated dataset.
% - Evaluate the performance of each model and select the best-performing model for deployment.
%
% The selected model can then be used to make predictions on new, unseen data or for
% any other classification or regression tasks related to brain tumor detection or classification.

% ref : https://www.mathworks.com/content/dam/mathworks/tag-team/Objects/i/88400_93009v00_Image_Class_Bag_Features_2016.pdf
% ref : https://stackoverflow.com/questions/23159828/how-to-get-a-fixed-size-sift-feature-vector
