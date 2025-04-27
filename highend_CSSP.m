function [total_area, ratio_clean_to_dirty, cleaned_squares]=highend_CSSP(floorMap)
    global batteryLife;
    [y, Fs]=audioread('sounds/epic_music.mp3');
    sound(y, Fs, 16);
    batteryLife=250;
    [total_area, ratio_clean_to_dirty, cleaned_squares]=scottbot(floorMap, [3, 3], batteryLife);
end
