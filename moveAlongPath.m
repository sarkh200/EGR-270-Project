function [matrix, currentPosition, colorUnderBot]=moveAlongPath(matrix, path, currentPosition, colorUnderBot)
    for i=1:size(path, 1)
        [matrix, currentPosition, colorUnderBot]=moveBot(matrix, currentPosition, path(i, :), colorUnderBot, false);
    end

end
