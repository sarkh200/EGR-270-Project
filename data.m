global matrix;
function data = collectMapData(matrix)
    data(1) = sum(matrix(:) ~= 0);
    data(2) = sum(matrix(:) == 3);
    data(3) = sum(matrix(:) == 4);
end
