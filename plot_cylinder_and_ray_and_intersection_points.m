function plot_cylinder_and_ray_and_intersection_points(cylinder, ray, intersection_points)
    %figure('units','normalized','outerposition',[0 0 1 1]);
    figure;
    plot_cylinder(cylinder);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');    
    hold on;
    plot_ray(ray);
    plot_points(intersection_points);
end