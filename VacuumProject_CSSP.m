clear

global time;
global rechargeAmount;
global batteryLife;

time = 0;
rechargeAmount = 0;

[model, plan]=main_menu();
floorMap=getFloorPlans(plan);

switch model
    case 1
        batteryLife=250;
        scottbot(floorMap, [3,4], batteryLife);
    case 2
        batteryLife=350;
        scottbot(floorMap, [3,4], batteryLife);
    case 3
        batteryLife=250;
        scottbot(floorMap, [3,3], batteryLife);
end

clear sound
