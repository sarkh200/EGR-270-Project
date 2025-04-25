function [matrix, currentLocation, colorUnderBot]=moveAlongPath(matrix, path, colorUnderBot, batteryLife)

    currentLocation=path(1, :);

    for i=2:size(path, 1)
        [matrix, currentLocation, colorUnderBot, batteryLife]=moveBot(matrix, currentLocation, path(i, :), colorUnderBot, false, batteryLife);
    end

end
