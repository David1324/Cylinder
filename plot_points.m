function plot_points(points)
    num_of_points = size(points,2);
    if (num_of_points==0)
        fprintf('There are no intersection points!\n');
        return;
    end
    x = points(:,1)';
    y = points(:,2)';
    z = points(:,3)';
    point_size = 100;
    for i=1:length(x)
        current_x = x(i);
        current_y = y(i);
        current_z = z(i);
        scatter3(current_x,current_y,current_z,point_size,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor',[1 0 1])        
    end

end