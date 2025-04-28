function distance=distanceBetween(startPosition, endPosition)
    % distanceBetween finds the distance between start and end position
    % Inputs:
    %   startPosition = 1st position that it measures from
    %   endPosition = 2nd position that it measures from
    % Distance:
    %   distance = the distance between startPosition and endPosition
    distance=max(abs(startPosition(1)-endPosition(1)), abs(startPosition(2)-endPosition(2)));
end
