function sols = solve_equations_ray_and_vertical_cylinder(is_symbolic, ray,cylinder)
    vx = ray.unit_vec(1);
    vy = ray.unit_vec(2);
    vz = ray.unit_vec(3);

    px = ray.point(1);
    py = ray.point(2);
    pz = ray.point(3);

    r = cylinder.radius;

    %general_point_on_ray = (px+t*vx , py+t*vy , pz+t*vz) (only t is
    %unkown)
    %general_point_on_cylinder = (r*cos(theta) , r*sin(theta), z); (theta
    %and z are unkown)
    %we need to calculate the 3 variables t, theta, and z such that:
    %general_point_on_ray = general_point_on_cylinder
    
    %eq1: px+t*vx = r*cos(theta)
    %eq2: py+t*vy = r*sin(theta)
    %eq3: pz+t*vz = z
    
    %from eq1 and eq2 we calucate the square of each one and get:
    % (px+t*vx)^2 = r^2*cos(theta)^2
    % (py+t*vy)^2 = r^2*sin(theta)^2
    % and therefore (px+t*vx)^2+(py+t*vy)^2=r^2
    % extract all the variables and you'll get that:
    % a*t^2 + b*t + c = 0
    % where a,b,c are defined bellow:

    a = vx^2+vy^2;
    b = 2*vx*px + 2*vy*py;
    c = px^2+py^2-r^2;

    %solve a*t^2+b*t+c=0
    sols = [];
    eps = 10^-10;
    if (~is_symbolic && abs(a) < eps)
        %this is a linear equation since a=0.
        %therefore:
        sol.t = -c/b;
        sol = calc_sol_fields(is_symbolic, sol.t, px, py, pz, vx, vy, vz, r);
        if sol1.t>0 %since it's a ray and not a line, we want only the solutions where t>0
            sols = [sols , sol1];
        end        
    else
        det = b^2-4*a*c;
        if (is_symbolic || det >= 0)
            sol1.t = (-b + sqrt(det))/(2*a);
            sol1 = calc_sol_fields(is_symbolic, sol1.t, px, py, pz, vx, vy, vz, r);
            if (is_symbolic || sol1.t>0) %since it's a ray and not a line, we want only the solutions where t>0
                sols = [sols , sol1];
            end

            sol2.t = (-b - sqrt(det))/(2*a);
            sol2 = calc_sol_fields(is_symbolic, sol2.t, px, py, pz, vx, vy, vz, r);         
            if (is_symbolic || sol2.t>0) %since it's a ray and not a line, we want only the solutions where t>0
                sols = [sols , sol2];
            end
        end
    end
end