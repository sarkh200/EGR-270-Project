[model, plan]=main_menu();
floorMap=getFloorPlans(plan);

switch model
    case 1
        batteryLife=250;
        noahbot(floorMap, batteryLife);
        case 2
            batteryLife=350;
            noahbot(floorMap, batteryLife);
        case 3
            batteryLife=250;
            scottbot(floorMap, batteryLife);
end

clear sound
