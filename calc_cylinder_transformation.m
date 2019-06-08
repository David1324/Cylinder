function [rotation, translation] = calc_cylinder_transformation(is_symbolic, cylinder)
    %This function calculates a 3x3 rotation matrix and a 3x1 translation vector such that:
    %1. rotation*cylinder.unit_vec'=[0,0,1]'
    %2. rotation*cylinder.point'+translation' = [0,0,0]'
    
    other_vecs = null(cylinder.unit_vec);
    u = other_vecs(:,1).';
    w = other_vecs(:,2).';
    if is_symbolic
        u_norm = sqrt(sum(u.^2));
        w_norm = sqrt(sum(w.^2));
        u = u/u_norm;
        w = w/w_norm;
    end
    rotation = [u ; w ; cylinder.unit_vec];
    det_rotation = det(rotation); %(det_rotation can be only 1 or -1)
    if ~is_symbolic
        if (det_rotation<0)
            rotation(1,:) = -rotation(1,:);
        end        
    end
    
    if ~is_symbolic
        %check (rotated_unit_vec should be [0,0,1])
        rotated_unit_vec = (rotation * cylinder.unit_vec.').';
        diff_vecs = rotated_unit_vec-[0,0,1];
        eps = 10^-10;
        if (norm(diff_vecs)>eps)
            error('Rotation is not correct!');
        end
    end
    
    rotated_point = (rotation * cylinder.point.').';
    translation = -rotated_point;
end