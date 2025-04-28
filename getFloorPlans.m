function floorMap=getFloorPlans(inFileName)
    %   getFloorPlans gets the floor plan based on inputted file name
    %  Input:
    %   inFileName = name of the file to open
    % Output:
    %   floorMap = matrix that represents the floor map
    inFid=fopen(inFileName); %Open the input file for reading
    columns=length(erase(fgetl(inFid), " ")); %Read the first line and remove spaces to determine the number of columns
    fseek(inFid, 0, 'bof'); %Reset the file position indicator back to the beginning of the file
    floorMap=fscanf(inFid, '%i', [columns, Inf])'; %Read the file as integers into a 2D array
    fclose(inFid); %Close the file
end
