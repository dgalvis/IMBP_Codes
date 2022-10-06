function three_node_gradient(make_figures, name)
    figure('Renderer','painters', 'Position', [500,500,600,600]);hold all;
    ax = gca;
    ax.LineWidth=2;
    ax.FontSize = 20;
    colormap jet;
    theta = -pi-0.1:0.01:3*pi/2+0.1;
    [x, y] = meshgrid(theta, theta);
    
    list_xy = [x(:), y(:)];
    A = [1,1;1,-1];
    
    c = (A\list_xy')';
    
    theta_vals = [c(:,1) + c(:,2), c(:,1) - c(:,2), -2*c(:,1)];
    
    V = 3 - cos(theta_vals(:,2) - theta_vals(:,1)) ...
          - cos(theta_vals(:,3)-theta_vals(:,1)) ...
          - cos(theta_vals(:,2)-theta_vals(:,3));
    
    F1 = scatteredInterpolant(theta_vals(:,1), theta_vals(:,2), theta_vals(:,3));
    F2 = scatteredInterpolant(theta_vals(:,1), theta_vals(:,2), V);
    
    ang = angle((exp(1j*theta_vals(:,1)) +exp(1j*theta_vals(:,2))+exp(1j*theta_vals(:,3)))/3);
    F3 = scatteredInterpolant(theta_vals(:,1), theta_vals(:,2), ang, 'nearest', 'linear');
    
    z = F1(x,y);
    v = F2(x,y);
    phi = F3(x,y);
    
    pcolor(x,y,v);
    shading interp;
    
    xlabel('\theta_1', 'FontSize', 20);
    ylabel('\theta_2', 'FontSize', 20);
    xticks([-pi, -pi/2, 0, pi/2, pi, 3*pi/2]);
    yticks([-pi, -pi/2, 0, pi/2, pi, 3*pi/2]);
    xticklabels({'-\pi', '-\pi/2', '0', '\pi/2', '\pi', '3\pi/2'});
    yticklabels({'-\pi', '-\pi/2', '0', '\pi/2', '\pi', '3\pi/2'});
    axis([-pi, 3*pi/2, -pi, 3*pi/2]);
    colorbar;
    if flag
        exportgraphics(gcf, fullfile('figures', name), 'Resolution', 600);
    end

end