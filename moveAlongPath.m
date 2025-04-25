function [matrix, currentLocation, colorUnderBot]=moveAlongPath(matrix, path, currentLocation, colorUnderBot)
    for i=1:size(path, 1)
        [matrix, currentLocation, colorUnderBot]=moveBot(matrix, currentLocation, path(i, :), colorUnderBot, false);
    end

end
