function image_processing_tool

    % Create the main GUI window
    fig = uifigure('Name', 'Simple Image Processing Tool', ...
                   'Position', [300 150 900 600]);

    % Title
    uilabel(fig, ...
        'Text', 'Simple Image Processing Tool', ...
        'Position', [270 550 400 30], ...
        'FontSize', 22, ...
        'FontWeight', 'bold');

    % Axes for original image
    ax1 = uiaxes(fig, ...
        'Position', [50 220 350 280]);

    title(ax1, 'Original Image');

    % Axes for processed image
    ax2 = uiaxes(fig, ...
        'Position', [500 220 350 280]);

    title(ax2, 'Processed Image');


    % Load Image button
    uibutton(fig, 'push', ...
        'Text', 'Load Image', ...
        'Position', [50 150 150 40], ...
        'FontSize', 14, ...
        'ButtonPushedFcn', @loadImage);


    % Enhance button
    uibutton(fig, 'push', ...
        'Text', 'Enhance Image', ...
        'Position', [220 150 150 40], ...
        'FontSize', 14, ...
        'ButtonPushedFcn', @enhanceImage);


    % Filter button
    uibutton(fig, 'push', ...
        'Text', 'Apply Filter', ...
        'Position', [390 150 150 40], ...
        'FontSize', 14, ...
        'ButtonPushedFcn', @filterImage);


    % Edge detection button
    uibutton(fig, 'push', ...
        'Text', 'Detect Edges', ...
        'Position', [560 150 150 40], ...
        'FontSize', 14, ...
        'ButtonPushedFcn', @detectEdges);


    % Reset button
    uibutton(fig, 'push', ...
        'Text', 'Reset', ...
        'Position', [730 150 100 40], ...
        'FontSize', 14, ...
        'ButtonPushedFcn', @resetImage);


    % Status label
    status = uilabel(fig, ...
        'Text', 'Load an image to begin.', ...
        'Position', [250 80 400 30], ...
        'FontSize', 14, ...
        'HorizontalAlignment', 'center');


    % Store image data
    originalImage = [];


    % Load Image
    function loadImage(~, ~)

        [file, path] = uigetfile( ...
            {'*.jpg;*.jpeg;*.png;*.bmp', ...
             'Image Files (*.jpg, *.jpeg, *.png, *.bmp)'});

        if isequal(file, 0)

            status.Text = 'No image selected.';
            return;

        end

        originalImage = imread(fullfile(path, file));

        imshow(originalImage, 'Parent', ax1);

        title(ax1, 'Original Image');

        % Display original image initially
        imshow(originalImage, 'Parent', ax2);

        title(ax2, 'Processed Image');

        status.Text = 'Image loaded successfully.';

    end

    % Enhance Image
 
    function enhanceImage(~, ~)

        if isempty(originalImage)

            status.Text = 'Please load an image first.';
            return;

        end

        % Convert image to grayscale
        grayImage = im2gray(originalImage);

        % Improve image contrast
        enhancedImage = imadjust(grayImage);

        imshow(enhancedImage, 'Parent', ax2);

        title(ax2, 'Enhanced Image');

        status.Text = 'Image enhancement completed.';

    end

    % Apply Filter
  
    function filterImage(~, ~)

        if isempty(originalImage)

            status.Text = 'Please load an image first.';
            return;

        end

        % Convert image to grayscale
        grayImage = im2gray(originalImage);

        % Apply median filter
        filteredImage = medfilt2(grayImage);

        imshow(filteredImage, 'Parent', ax2);

        title(ax2, 'Filtered Image');

        status.Text = 'Median filtering completed.';

    end


    % Detect Edges
    
    function detectEdges(~, ~)

        if isempty(originalImage)

            status.Text = 'Please load an image first.';
            return;

        end

        % Convert image to grayscale
        grayImage = im2gray(originalImage);

        % Detect edges using Canny method
        edgeImage = edge(grayImage, 'Canny');

        imshow(edgeImage, 'Parent', ax2);

        title(ax2, 'Edge Detection');

        status.Text = 'Edges detected successfully.';

    end

    % Reset
    
    function resetImage(~, ~)

        if isempty(originalImage)

            status.Text = 'No image to reset.';
            return;

        end

        imshow(originalImage, 'Parent', ax2);

        title(ax2, 'Processed Image');

        status.Text = 'Image reset successfully.';

    end

end
