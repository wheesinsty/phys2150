function chargesOnPolygon()

    ke = 8.99e9;
    q = 1e-9;
    s = 0.01;

    n_values = 3:8;

    x = linspace(-0.02, 0.02, 100);
    y = linspace(-0.02, 0.02, 100);
    [X, Y] = meshgrid(x, y);

    for n = n_values
        if ~isinteger(n) && (n < 3 || n > 8)
            error('n must be an integer between 3 and 8.');
        end

        R = s / (2 * sin(pi / n));

        theta = (0:n-1) * (2 * pi / n);
        x_vertices = R * cos(theta);
        y_vertices = R * sin(theta);

        V = zeros(size(X));

        for i = 1:n
            V = V + ke * q ./ sqrt((X - x_vertices(i)).^2 + (Y - y_vertices(i)).^2);
        end

        figure;
        contourf(X, Y, V, 5);
        colorbar;
        title(['Electric Potential for n = ', num2str(n)]);
        xlabel('x (m)');
        ylabel('y (m)');
        axis equal;
        grid on;
    end
end
