function cylinder = get_random_cylinder(is_symbolic)    
    if is_symbolic
	david bla bla
        syms r;
        cylinder.unit_vec = sym('v',[1 3]);
        cylinder.point = sym('p',[1 3]);
%         cylinder.unit_vec = [0 0 1];
%         cylinder.point = [0 0 0];        
        cylinder.radius = r;
    else
        vec = rand(1,3);
        norm_vec = norm(vec);
        cylinder.unit_vec = vec/norm_vec;
        cylinder.point = rand(1,3);
        cylinder.radius = 7;        
    end
end
