function ray = get_random_ray(is_symbolic)
    if is_symbolic
        ray.unit_vec = sym('a',[3 1]);
        ray.point = sym('q',[3 1]);        
    else
        vec = rand(1,3);
        norm_vec = norm(vec);
        ray.unit_vec = vec/norm_vec;
        min_val = -8;
        max_val = 8;
        ray.point = min_val + (max_val - min_val) * rand(1,3);        
    end
end