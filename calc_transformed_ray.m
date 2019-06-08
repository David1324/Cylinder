function transformed_ray = calc_transformed_ray(ray, rotation, translation)
    transformed_ray.unit_vec = (rotation*ray.unit_vec.').';
    transformed_ray.point = (rotation*ray.point.').' + translation;
end