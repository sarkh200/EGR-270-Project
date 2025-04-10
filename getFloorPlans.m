function floorMap = getFloorPlans(choice_floor)

    switch choice_floor
        case 1
            inFileName = "floor plans/floor_plan_1.floor";
            case 2
            inFileName = "floor plans/floor_plan_2.floor";
            case 3
            inFileName = "floor plans/floor_plan_3.floor";
            case 4 
            inFileName = "floor plans/floor_plan_4.floor";
    end

    inFid = fopen(inFileName);
    floorMap = fscanf(inFid, '%i', [25 30])';
    fclose(inFid);

end
