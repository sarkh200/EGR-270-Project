clear
clear sound

% initialize the global variables
global time rechargeAmount;

time=0;
rechargeAmount=0;

% Selecting which robot model and floor plan to use
[model, plan]=main_menu();
floorMap=getFloorPlans(plan);

% pick model based on model selected
switch model
    case 1
        [total_area, ratio_clean_to_dirty, cleaned_squares]=economy_CSSP(floorMap);
    case 2
        [total_area, ratio_clean_to_dirty, cleaned_squares]=regular_CSSP(floorMap);
    case 3
        [total_area, ratio_clean_to_dirty, cleaned_squares]=highend_CSSP(floorMap);
end

%Printing out data
fprintf('%.2f%% of the floor was covered with dirt.\n', ratio_clean_to_dirty);
fprintf('Floor plan surface area: %d square feet.\n', total_area);
fprintf('The robot took %d seconds to clean the house.\n', time);
fprintf('The robot had to recharge %d times.\n', rechargeAmount);

clear sound
