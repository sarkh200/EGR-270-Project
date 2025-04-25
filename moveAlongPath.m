function [matrix, currentLocation, colorUnderBot]=moveAlongPath(matrix, path, currentLocation, colorUnderBot, batteryLife)
    for i=1:size(path, 1)
        [matrix, currentLocation, colorUnderBot, batteryLife]=moveBot(matrix, currentLocation, path(i, :), colorUnderBot, false, batteryLife);
    end

end
