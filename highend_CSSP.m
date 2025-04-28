function [total_area, ratio_clean_to_dirty, cleaned_squares]=highend_CSSP(floorMap) %Simulates the high end cleaning robot
    global batteryLife;
    [y, Fs]=audioread('sounds/epic_music.mp3'); %Plays epic music
    sound(y, Fs, 16); 
    batteryLife=250; %Sets battery life
    [total_area, ratio_clean_to_dirty, cleaned_squares]=scottbot(floorMap, [3, 3], batteryLife); %Pulls floormap, total area, clean, dirty squares
end
