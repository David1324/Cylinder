function final_points = calc_inverse_transformation(points, rotation, translation)
    final_points = [];
    inverse_rotation = rotation.'; %transpose of rotation matrix is its inverse
    num_of_points = size(points,1);
    for i=1:num_of_points
        current_point = points(i,:);
        current_final_point = (inverse_rotation*(current_point-translation).').';
        final_points = [final_points ; current_final_point];
    end
end