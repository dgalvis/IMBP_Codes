function coupling_figure(angles, name, flag)
    figure('Renderer','painters', 'Position', [500,500,600,600]);hold all;
    ax = gca;
    t = 0:0.01:2*pi;
    plot(cos(t), sin(t), 'k', 'linewidth', 2);
    yticks([-1, 1]);
    xticks([-1,1]);
    xlabel('cos(\theta)', 'FontSize', 20, 'FontWeight','bold');
    ylabel('sin(\theta)', 'FontSize', 20, 'FontWeight','bold');
    axis tight;
    axis([-1.01,1.01,-1.01,1.01]);
    box on;
    ax.FontSize = 20;
    ax.LineWidth = 2;
    
    
    
    scatter(cos(angles(1))-0.01,sin(angles(1)) + 0.01, 500, 'red', 'filled');
    scatter(cos(angles(2)) - 0.01,sin(angles(2)) - 0.01, 500, 'blue', 'filled');
    
    if(length(angles)>2)
        scatter(cos(angles(3)) + 0.01,sin(angles(3)) - 0.01, 500, 'k', 'filled');
    end
    if flag
        exportgraphics(gcf, fullfile('figures', name), 'Resolution', 600);
    end
end