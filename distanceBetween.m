%Finds the distance between start and end position
function distance=distanceBetween(startPosition, endPosition)
    distance=max(abs(startPosition(1)-endPosition(1)), abs(startPosition(2)-endPosition(2)));
end
