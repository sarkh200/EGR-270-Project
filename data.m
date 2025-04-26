function data=collectMapData(matrix)

    data_totalSquares=sum(matrix(:)~=0);
    data_dirtySquares=sum(matrix(:)==3);
    data_cleanSquares=sum(matrix(:)==4);
    data_cleanedSquares=sum(matrix(:)>=5);
    data_startPosition=find(matrix(:)==1);
    data_chargerPosition=find(matrix(:)==2);

end
