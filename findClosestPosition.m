%Compares all of the possible paths to the goal position and finds the shortest path
%Input arguments:
% Current position
% List of Positions
%Output arguments:
% closestpos = closest possible position from the list of all positions
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
