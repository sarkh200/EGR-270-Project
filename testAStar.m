matrix=[
        0 0 0 0 0 0 0 0 0 0
        0 2 4 4 4 4 4 4 4 0
        0 0 0 0 0 0 0 0 4 0
        0 4 4 4 4 4 4 4 4 0
        0 4 0 0 0 0 0 0 0 0
        0 4 4 4 4 4 4 4 4 0
        0 0 0 0 0 0 0 0 4 0
        0 4 4 4 4 4 4 4 4 0
        0 4 0 0 0 0 0 0 0 0
        0 4 4 4 4 4 4 4 4 0
        0 0 0 0 0 0 0 0 4 0
        0 4 4 4 4 4 4 4 4 0
        0 4 0 0 0 0 0 0 0 0
        0 4 4 4 4 4 4 4 4 0
        0 0 0 0 0 0 0 0 4 0
        0 4 4 4 4 4 4 4 4 0
        0 4 0 0 0 0 0 0 0 0
        0 4 4 4 4 4 4 4 4 0
        0 0 0 0 0 0 0 0 4 0
        0 4 4 4 4 4 4 4 3 0
        0 0 0 0 0 0 0 0 0 0
        ];

[r, c]=find(matrix==2);
startLocation=[r, c];

[r, c]=find(matrix==3);
endLocation=[r-1, c];

path=aStarPath(matrix, startLocation, endLocation);

[matrix, currentLocation, colorUnderBot]=moveAlongPath(matrix, path, 2, 100);

[matrix, currentLocation, colorUnderBot, batteryLife, ~]=moveBot(matrix, currentLocation, [r, c], colorUnderBot, batteryLife, true, 1);

path=aStarPath(matrix, currentLocation, startLocation);

[~, ~, ~]=moveAlongPath(matrix, path, colorUnderBot, 100);
