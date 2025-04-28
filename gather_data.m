function [total_area, ratio_clean_to_dirty] = gather_data(matrix)
%gather_data gathers the selected floormap data like total area, dirty squares, and clean to dirty squares ratio
% Input arguments:
% matrix = floor plan
% Output arguments:
% Total area, dirty squares, and clean to dirty squares ratio
    total_area = length(find(matrix~=0)); %total squares excluding the walls
    dirty_squares = length(find(matrix==3)); %total dirty squares
    % clean_squares = length(find(matrix==4));
    ratio_clean_to_dirty = dirty_squares/(total_area-1)*100; % Dirty floor percentage
end