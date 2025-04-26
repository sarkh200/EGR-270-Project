clear
clear sound

global time rechargeAmount batteryLife;

time=0;
rechargeAmount=0;
% Selecting which robot model and floor plan to use 
[model, plan]=main_menu();
floorMap=getFloorPlans(plan);

switch model
    case 1
        batteryLife=250;
        [total_area, ratio_clean_to_dirty, cleaned_squares]=scottbot(floorMap, [3, 4], batteryLife);
    case 2
        batteryLife=350;
        [total_area, ratio_clean_to_dirty, cleaned_squares]=scottbot(floorMap, [3, 4], batteryLife);
    case 3
        batteryLife=250;
        [total_area, ratio_clean_to_dirty, cleaned_squares]=scottbot(floorMap, [3, 3], batteryLife);
end

%Printing out data
fprintf('0.2%f% of the floor was covered with dirt.', ratio_clean_to_dirty);
fprintf('Floor plan surface area: %d square feet', total_area);
fprintf('The robot took %d seconds to clean the house', time);
fprintf('The robot had to recharge %d times.', rechargeAmount);

clear sound
