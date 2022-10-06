function figure2(Omega, K, flag, name)

    phi = 0:0.1:2*pi;
    sinphi = sin(phi);
    OmegaK  = Omega/K*ones(size(sinphi));
    
    figure('Renderer', 'painters', 'Position', [10 10 600 600]);hold all;
    ax = gca;
    plot(phi, sinphi, 'k', 'linewidth', 2);
    plot(phi, OmegaK, 'b', 'linewidth', 2);
    if abs(OmegaK(1)) < 1
        plot(mod([asin(OmegaK(1)), asin(OmegaK(1))], [-1, 1], 2*pi), 'r', 'linewidth', 2);
        plot(mod([pi - asin(OmegaK(1)), pi - asin(OmegaK(1))], 2*pi), [-1, 1], 'r--', 'linewidth', 2);
    else
        disp('no intersections');
    end
    ax.FontSize = 20;
    ax.LineWidth = 2;
    xlabel('\phi');
    xticks([0, pi/2, pi, 3*pi/2, 2*pi]);
    xticklabels({0, '\pi/2', '\pi', '3\pi/2','2\pi'});
    xlim([0, 2*pi]);
    yticks(sort([-1,0,1, round(OmegaK(1)),2]));
    legend('sin(\phi)', '\Omega/K', 'FontSize', 20);
    box on

    if flag
        exportgraphics(gcf, fullfile('figures', name), 'Resolution', 600);
    end

end