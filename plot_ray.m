function plot_ray(ray)
    ray_color = [1 0 0];
    t_min = 0;
    t_max = 50;
    point1 = ray.point + t_min * ray.unit_vec;
    point2 = ray.point + t_max * ray.unit_vec;
    x = [point1(1) point2(1)];
    y = [point1(2) point2(2)];
    z = [point1(3) point2(3)];
    plot3(x,y,z,'color',ray_color,'LineWidth',3);
end