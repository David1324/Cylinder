function sol = calc_sol_fields(is_symbolic, t, px, py, pz, vx, vy, vz, r)

    %eq1: px+t*vx = r*cos(theta)
    %eq2: py+t*vy = r*sin(theta)
    %eq3: pz+t*vz = z
    
    sol.t = t;
    sol.z = pz + t*vz;
    
    theta = acos((px+t*vx)/r);
    theta_sols = [theta , -theta];
    
    eps = 10^-20;
    for i=1:length(theta_sols)
        left_side = py+t*vy;
        right_side = r*sin(theta_sols(i));
        diff_sides = left_side-right_side;
        diff_sides_sqr = diff_sides^2;
        if (is_symbolic || diff_sides_sqr < eps)
            sol.theta = theta_sols(i);
        end
    end
end