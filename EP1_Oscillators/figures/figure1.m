function figure1(t, y, flag, name)

    figure('Renderer', 'painters', 'Position', [10 10 600 600]);
    tiledlayout(size(y,2), 2);
    
    nexttile(1, [size(y,2),1]);hold all;
    ax = gca;
    colors = ['b', 'r', 'g'];
    for i = 1:size(y,2)
        plot(t,y(:,i), colors(i), 'linewidth', 2);
    end
    xticks([min(t), max(t)]);
    yticks([0, floor(max(y(:)))]);
    ylabel('\theta', 'FontSize', 20, 'FontWeight','bold');
    xlabel('time', 'FontSize', 20);
    legend('\theta_1', '\theta_2', '\theta_3', 'Fontsize', 20, 'location', 'northwest');
    ax.LineWidth=2;
    ax.FontSize = 20;
    ylim([0, floor(max(y(:)))]);
    xlim([min(t), max(t)]);
    axis tight;
    box on
    
    colors = ['b', 'r', 'g'];
    for i = 1:size(y,2)
        nexttile;
        ax = gca;
        plot(t,mod(y(:,i), 2*pi), colors(i), 'linewidth', 2);
        ylabel(['\theta_', num2str(i)], 'FontSize', 20, 'FontWeight','bold');
        xlabel('time', 'FontSize', 20);
        ax.LineWidth=2;
        ax.FontSize = 20;
        yticks([0, 2*pi]);
        yticklabels({0, '2\pi'});
        xticks([min(t), max(t)]);
        axis tight;
        ylim([-.1, 2*pi]);
        xlim([min(t), max(t)]);
    end
    if flag
        exportgraphics(gcf, fullfile('figures', name), 'Resolution', 600);
    end
end