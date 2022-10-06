function two_node_gradient(flag, name)
    figure('Renderer','painters', 'Position', [500,500,1200,600]);hold all;
    tcl = tiledlayout(1,2);
    colormap jet;
    nexttile;hold all;
    ax = gca;
    
    theta = 0:0.1:3*pi;
    
    [x,y] = meshgrid(theta, theta);
    
    pcolor(x, y, 1 - cos(x - y));
    shading interp;
    xlabel('\theta_1', 'FontSize', 20);
    ylabel('\theta_2', 'FontSize', 20);
    xticks([0, pi/2, pi, 3*pi/2, 2*pi]);
    yticks([0, pi/2, pi, 3*pi/2, 2*pi]);
    xticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
    yticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
    axis tight;
    axis([0, 2*pi, 0, 2*pi]);
    box on;
    ax.FontSize = 20;
    ax.LineWidth = 2;
    
    nexttile;hold all;
    ax = gca;
    theta = 0:0.1:3*pi;
    
    [x,y] = meshgrid(theta, theta);
    
    surf(x, y, 1 - cos(x - y));
    view([-10, 30]);
    shading interp;
    xlabel('\theta_1', 'FontSize', 20);
    ylabel('\theta_2', 'FontSize', 20);
    xticks([0, pi/2, pi, 3*pi/2, 2*pi]);
    yticks([0, pi/2, pi, 3*pi/2, 2*pi]);
    xticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
    yticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
    axis tight;
    axis([0, 2*pi, 0, 2*pi])
    box on;
    ax.FontSize = 20;
    ax.LineWidth = 2;
    if flag
        exportgraphics(gcf, fullfile('figures', name), 'Resolution', 600);
    end
end