inFileName = input("Enter name of floor file: ", "s");
inFid = fopen(inFileName);
A = fscanf(inFid, "%i", [25 30])';
fclose(inFid);

drawFloorPlan(A);
