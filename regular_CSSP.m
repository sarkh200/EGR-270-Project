function [total_area, ratio_clean_to_dirty, cleaned_squares]=regular_CSSP(floorMap) %Simulates the cleaning routine with the regular  model
    global batteryLife;
    [y, Fs]=audioread('sounds/classical.mp3'); %Plays classical music
    sound(y, Fs, 16);
    batteryLife=350; %Sets battery life
    [total_area, ratio_clean_to_dirty, cleaned_squares]=scottbot(floorMap, [3, 4], batteryLife); %Pulls floormap, total area, clean, and dirty squares
end
