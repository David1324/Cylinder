function transformed_cylinder = calc_transformed_cylinder(cylinder, rotation, translation)
    %transformed_cylinder.unit_vec should be [0,0,1]
    %transformed_cylinder.point should be [0,0,0] (origin);    
    transformed_cylinder.unit_vec = (rotation*cylinder.unit_vec.').';
    transformed_cylinder.point = (rotation*cylinder.point.').' + translation;
    transformed_cylinder.radius = cylinder.radius;
end