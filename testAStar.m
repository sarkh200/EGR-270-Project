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
        0 5 4 4 4 4 4 4 4 0
        0 0 0 0 0 0 0 0 0 0
        ];

[r, c]=find(matrix==2);
startLocation=[r, c];

[r, c]=find(matrix==5);
endLocation=[r, c];

path=aStarPath(matrix, startLocation, endLocation);

[matrix, currentLocation, colorUnderBot]=moveAlongPath(matrix, path, 2, 100);

path=aStarPath(matrix, currentLocation, startLocation);

[~, ~, ~]=moveAlongPath(matrix, path, 4, 100);
