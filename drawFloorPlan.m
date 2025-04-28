function drawFloorPlan(matrix)
    % Input Arguments:
    % matrix = the map of the floor in the form of a matrix
    % Output Arguments:
    % None
    matrix=matrix+1;

    map=[
         0 0 0; %black, inaccessible
         1 0 0; %red, current robot Position
         0 0 1; %blue, charging station
         127/255 50/255 50/255; %brown, dirty floor
         1 1 1; %white, clean floor
    %  .5 .5 .5; %display cleaned squares (optional)
         ];
    image(matrix) % display the contents of matrix A
    colormap(map) % Set the colormap to map
    axis('image') % resize the plot in the figure to the aspect ratio of the matrix
    axis off % turn off the axis labels
    drawnow update;
end
