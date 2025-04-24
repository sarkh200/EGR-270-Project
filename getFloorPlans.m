function floorMap = getFloorPlans(inFileName)
    inFid = fopen(inFileName);
    columns = length(erase(fgetl(inFid), " "));
    fseek(inFid, 0, 'bof');
    floorMap = fscanf(inFid, '%i', [columns, Inf])';
    fclose(inFid);
end
