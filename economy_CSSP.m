function [total_area, ratio_clean_to_dirty, cleaned_squares]=economy_CSSP(floorMap) %Simulates an economical cleaning routine with a robot
    global batteryLife;
    [y, Fs]=audioread('sounds/classical.mp3'); %Play classical music
    sound(y, Fs, 16);
    batteryLife=250; %Set the battery life
    [total_area, ratio_clean_to_dirty, cleaned_squares]=scottbot(floorMap, [3, 4], batteryLife); %Pull floormap, total area, clean, and dirty squares
end
