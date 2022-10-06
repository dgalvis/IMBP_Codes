function phase_shift_figure(ang, flag, name)

    figure('Renderer','painters', 'Position', [500,500,600,600]);hold all;
    colormap jet;
    ax = gca;
    t = 0:0.01:2*pi;
    plot(cos(t), sin(t), 'k', 'linewidth', 2);
    yticks([-1, 1]);
    xticks([-1,1]);
    xlabel('cos(\theta)', 'FontSize', 20, 'FontWeight','bold');
    ylabel('sin(\theta)', 'FontSize', 20, 'FontWeight','bold');
    axis tight;
    axis([-1,1,-1,1]);
    box on;
    ax.FontSize = 20;
    ax.LineWidth = 2;
    
    low = 0;
    high = pi/2;
    theta = (high - low)*rand(1,15) + low;
    
    theta = theta - angle(mean(exp(1j*theta))) + ang;
    x = mean(exp(1j*theta));
    r = abs(x);
    phi = angle(x);
    
    scatter(cos(theta), sin(theta), 100, theta, 'filled');
    plot([0, r*cos(phi)], [0, r*sin(phi)], 'blue', 'linewidth', 2);
    scatter(r*cos(phi), r*sin(phi), 100, 'filled', 'blue');
    if flag
        exportgraphics(gcf, fullfile('figures', name), 'Resolution', 600);
    end

end