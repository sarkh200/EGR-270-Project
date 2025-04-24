function data = collectMapData(matrix)

    data_totalSquares = sum(matrix(:) ~= 0);
    data_dirtySquares = sum(matrix(:) == 3);
    data_cleanSquares = sum(matrix(:) == 4);
    data_cleanedSquares = sum(matrix(:) >= 5);
    data_startLocation = find(matrix(:) == 1);
    data_chargerLocation = find(matrix(:) == 2);

end
