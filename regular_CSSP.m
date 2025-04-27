function [total_area, ratio_clean_to_dirty, cleaned_squares]=regular_CSSP(floorMap)
    global batteryLife;
    [y, Fs]=audioread('sounds/classical.mp3');
    sound(y, Fs, 16);
    batteryLife=350;
    [total_area, ratio_clean_to_dirty, cleaned_squares]=scottbot(floorMap, [3, 4], batteryLife);
end
