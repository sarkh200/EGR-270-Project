function [matrix, currentLocation, colorUnderBot]=moveAlongPath(matrix, path, currentLocation, colorUnderBot, batteryLife)

    %currentLocation=path(1, :);
    disp(colorUnderBot);
    for i=1:size(path, 1)
        [matrix, currentLocation, colorUnderBot, batteryLife]=moveBot(matrix, currentLocation, path(i, :), colorUnderBot, false, batteryLife);
        disp(colorUnderBot);
    end

end
