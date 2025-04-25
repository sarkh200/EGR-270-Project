[model, plan]=main_menu();
floorMap=getFloorPlans(plan);

switch model
    case 1
        batteryLife=250;
    case 2
        batteryLife=350;
    case 3
        batteryLife=250;
end

drawFloorPlan(floorMap);

noahbot(floorMap, batteryLife);

clear sound
