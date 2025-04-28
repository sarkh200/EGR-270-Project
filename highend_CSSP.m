function [total_area, ratio_clean_to_dirty, cleaned_squares]=highend_CSSP(floorMap)
    % Input Arguments:
    % floorMap = the total map of the floor
    % Output Arguments: 
    % total_area = the total area of the map excluding the walls
    % ratio_clean_to_dirty = the percentage of the dirty floor compared to the clean floor
    % cleaned_squares = the total amount of cleaned squares that the roomba has already gone over
    global batteryLife;
    [y, Fs]=audioread('sounds/epic_music.mp3'); %Plays epic music
    sound(y, Fs, 16); 
    batteryLife=250; %Sets battery life
    [total_area, ratio_clean_to_dirty, cleaned_squares]=scottbot(floorMap, [3, 3], batteryLife); %Pulls floormap, total area, clean, dirty squares
end
