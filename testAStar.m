matrix=[
        0 0 0 0 0 0 0 0 0 0
        0 4 4 4 4 4 4 4 4 0
        0 4 4 4 4 4 4 4 4 0
        0 4 4 4 4 4 4 4 4 0
        0 0 0 0 0 0 0 0 0 0
        ];

startLocation=[2, 2];

endLocation=[9 2];

path=aStarPath(matrix, startLocation, endLocation);
