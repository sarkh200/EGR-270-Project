function [total_area, ratio_clean_to_dirty, cleaned_squares]=economy_CSSP(floorMap)
    % Input Arguments:
    % floorMap = the total map of the floor
    % Output Arguments: 
    % total_area = the total area of the map excluding the walls
    % ratio_clean_to_dirty = the percentage of the dirty floor compared to the clean floor
    % cleaned_squares = the total amount of cleaned squares that the roomba has already gone over
    global batteryLife;
    [y, Fs]=audioread('sounds/classical.mp3'); %Play classical music
    sound(y, Fs, 16);
    batteryLife=250; %Set the battery life
    [total_area, ratio_clean_to_dirty, cleaned_squares]=scottbot(floorMap, [3, 4], batteryLife); %Pull floormap, total area, clean, and dirty squares
end
