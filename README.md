# MATLAB-Image-Processing

Simple Image Processing Tool Using MATLAB
Task 4 — Image Processing

A simple MATLAB GUI application for performing basic image-processing operations including image enhancement, filtering, and edge detection.

Problem Description

Digital image processing is used to improve and analyze images in many fields such as photography, engineering, medical imaging, and computer vision.

This project provides a simple graphical interface where a user can load an image and perform three basic operations: Image Enhancement,Image Filtering,Edge Detection.

Technology Used: MATLAB , MATLAB Image Processing Toolbox
Features: Load JPG, JPEG, PNG, and BMP images
Display the original image
Enhance image contrast
Apply median filtering
Detect edges using the Canny method

Image Processing Operations
1. Image Enhancement

The application converts the image to grayscale and improves its contrast using MATLAB's imadjust() function.

grayImage = im2gray(originalImage);
enhancedImage = imadjust(grayImage);
2. Image Filtering

A median filter is applied to reduce noise in the image.

filteredImage = medfilt2(grayImage);
3. Edge Detection

The Canny edge detection method is used to identify important boundaries in the image.

edgeImage = edge(grayImage, 'Canny');
