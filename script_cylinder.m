clear;
close all;
clc;

is_symbolic = false;

cylinder = get_random_cylinder(is_symbolic);
ray = get_random_ray(is_symbolic);

[rotation, translation] = calc_cylinder_transformation(is_symbolic, cylinder);
transformed_cylinder = calc_transformed_cylinder(cylinder, rotation, translation);
transformed_ray = calc_transformed_ray(ray, rotation, translation);
intersection_points_for_vertical_cylinder = calc_intersection_points_of_ray_and_vertical_cylinder(is_symbolic, transformed_ray,transformed_cylinder);
intersection_points = calc_inverse_transformation(intersection_points_for_vertical_cylinder, rotation, translation);

if ~is_symbolic
    plot_cylinder_and_ray_and_intersection_points(cylinder, ray, intersection_points);
end

if is_symbolic
    %print the symbolic intersection_points
    intersection_points
end





