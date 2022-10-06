function movie3(t, y, OmegaK, y0,  flag, name)
    if flag
        vidfile = VideoWriter(fullfile('figures', name), 'MPEG-4');
        vidfile.FrameRate = 30;
        open(vidfile);
    end


    phi = 0:0.1:2*pi;
    sinphi = sin(phi);
    OmegaK  = OmegaK*ones(size(sinphi));
    figure('Renderer', 'painters', 'Position', [10 10 600 600]);
    colormap jet;
    for i = 1:size(y,1)
        clf;
        tiledlayout(4,1);
        nexttile(1, [1,1]);hold all;
        ax = gca;
        scatter(mod(y(i,:), 2*pi) , ones(size(y(i,:)))- linspace(0, 1, size(y,2)), 20, y0, 'filled');
        if abs(OmegaK(1)) < 1
            plot(mod([asin(OmegaK(1)), asin(OmegaK(1))], 2*pi), [0, 1], 'r', 'linewidth', 2);
            plot(mod([pi - asin(OmegaK(1)), pi-asin(OmegaK(1))], 2*pi), [0, 1], 'r--', 'linewidth', 2);
        end
        ax.FontSize = 20;
        ax.LineWidth = 2;
        xlabel('\phi');
        xticks([0, pi/2, pi, 3*pi/2, 2*pi]);
        xticklabels({0, '\pi/2', '\pi', '3\pi/2','2\pi'});
        xlim([0, 2*pi]);
        yticks([]);
        yticklabels({});
        box on;
        
        nexttile(2, [3,1]);hold all;
        ax = gca;
        plot(phi, sinphi, 'k', 'linewidth', 2);
        plot(phi, OmegaK, 'b', 'linewidth', 2);
        if abs(OmegaK(1)) < 1
            plot(mod([asin(OmegaK(1)), asin(OmegaK(1))], 2*pi), [-1, 1], 'r', 'linewidth', 2);
            plot(mod([pi - asin(OmegaK(1)), pi-asin(OmegaK(1))], 2*pi), [-1, 1], 'r--', 'linewidth', 2);
        end
        ax.FontSize = 20;
        ax.LineWidth = 2;
        xlabel('\phi');
        xticks([0, pi/2, pi, 3*pi/2, 2*pi]);
        xticklabels({0, '\pi/2', '\pi', '3\pi/2','2\pi'});
        xlim([0, 2*pi]);
        yticks(sort(unique([-1,0,1, round(OmegaK(1),2)])));
        legend('sin(\phi)', '\Omega/K', 'FontSize', 20);
        box on;
        if flag
            F = getframe(gcf);
            writeVideo(vidfile, F);
        else
            pause(0.01);
        end
    end
    if flag
        close(vidfile);
    end
end