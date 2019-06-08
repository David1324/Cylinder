function plot_cylinder(cylinder)
    n = 100;
    [rotation, translation] = calc_cylinder_transformation(false, cylinder);
    inverse_rotation = rotation'; %transpose of rotation matrix is its inverse
    theta = linspace(0,360,n);
    z_vals = (-30 : 2 : 30)';
    Z = repmat(z_vals, 1, n);
    X = repmat(cylinder.radius * cosd(theta), length(z_vals), 1);
    Y = repmat(cylinder.radius * sind(theta), length(z_vals), 1);
    X_new = zeros(size(X));
    Y_new = zeros(size(Y));
    Z_new = zeros(size(Z));
    for i=1:size(X,1)
        for j=1:size(X,2)
            point = [X(i,j) , Y(i,j) , Z(i,j)];
            transformed_point = (inverse_rotation*(point-translation)')';
            X_new(i,j) = transformed_point(1);
            Y_new(i,j) = transformed_point(2);
            Z_new(i,j) = transformed_point(3);
        end
    end
    surf(X_new,Y_new,Z_new)
    axis square
end