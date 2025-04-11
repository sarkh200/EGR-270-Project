function floorMap = getFloorPlans(inFileName)
    inFid = fopen(inFileName);
    floorMap = fscanf(inFid, '%i', [25 30])';
    fclose(inFid);
end
