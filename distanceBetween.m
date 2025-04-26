function distance=distanceBetween(startLocation, endLocation)
    distance=max(abs(startLocation(1)-endLocation(1)), abs(startLocation(2)-endLocation(2)));
end
