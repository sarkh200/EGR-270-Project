function drawFloorPlan(A)
    A = A + 1;

    map = [
           0 0 0; %black, inaccessible
           1 0 0; %red, current robot location
           0 0 1; %blue, charging station
           127/255 50/255 50/255; %brown, dirty floor
           1 1 1; %white, clean floor
           ];
    image(A) % display the contents of matrix A
    colormap(map) % Set the colormap to map
    axis('image') % resize the plot in the figure to the aspect ratio of the matrix
    axis off % turn off the axis labels
end
