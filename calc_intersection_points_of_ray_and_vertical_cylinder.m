function intersection_points = calc_intersection_points_of_ray_and_vertical_cylinder(is_symbolic, ray,vertical_cylinder)
    %we assume here that vertical_cylinder.unit_vec = [0,0,1] and symmetric around
    %the origin
    intersection_points = [];
    diff_vecs = vertical_cylinder.unit_vec - [0,0,1];
    norm_diff_vecs = sqrt(sum(diff_vecs.^2));
    eps = 10^-10;
    if ~is_symbolic && norm_diff_vecs > eps
        error('The cylinder is not vertical!');
    elseif ~is_symbolic && norm(vertical_cylinder.point(1:2)) > eps
        error('The cylinder is not symmetric around the origin');
    else        
        sols = solve_equations_ray_and_vertical_cylinder(is_symbolic, ray,vertical_cylinder);
        num_of_sols = length(sols);
        for i=1:num_of_sols
            current_sol = sols(i);
            t = current_sol.t;
            theta = current_sol.theta;
            z = current_sol.z;
            point_on_ray = ray.point + t*ray.unit_vec;
            point_on_cylinder = [vertical_cylinder.radius*cos(theta), vertical_cylinder.radius*sin(theta), z];
            %point_on_ray and point_on_cylinder should be the same point
            %(since it's the intersection point)
            %check:
            diff_points = point_on_ray-point_on_cylinder;
            norm_diff_points = sqrt(sum(diff_points.^2));
            eps = 10^-10;
            if (~is_symbolic && norm_diff_points > eps)
                error('The intersection point is not correct');
            end
            current_intersection_point = point_on_ray; %or point_on_cylinder (doesn't matter..)
            intersection_points = [intersection_points ; current_intersection_point];
        end
    end
end