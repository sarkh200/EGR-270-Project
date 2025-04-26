function closestPos=findClosestPosition(currentPosition, listOfPositions)
    lowestDistance=distanceBetween(currentPosition, listOfPositions(1, :));
    closestPos=listOfPositions(1, :);

    for i=2:size(listOfPositions, 1)
        distance=distanceBetween(currentPosition, listOfPositions(i, :));
        if distance<lowestDistance
            lowestDistance=distance;
            closestPos=listOfPositions(i, :);
        end
    end
end
