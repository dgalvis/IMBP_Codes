function histogram1(omega, nbins, flag, name, pdf)

    figure('Renderer', 'painters', 'Position', [10 10 600 600]);hold all;
    ax = gca;
    h = histogram(omega, nbins, 'Normalization','probability');
    h.FaceColor = 'black'
    ylabel('probability', 'FontSize', 20, 'FontWeight','bold');
    xlabel('\omega_i', 'FontSize', 20, 'FontWeight','bold');
    ax.LineWidth=2;
    ax.FontSize = 20;


    if nargin > 4
        plot(pdf(1,:), pdf(2,:), 'linewidth', 2);
    end


    box on;
    if flag
        exportgraphics(gcf, fullfile('figures', name), 'Resolution', 600);
    end
end