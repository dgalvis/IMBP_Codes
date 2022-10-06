function movie4(t, y, OmegaK, flag, name)

    if size(y, 2) > 2
        error('movie4 requires y to be a t x 2 vector (only two nodes)')
    end

    figure('Renderer', 'painters', 'Position', [10 10 600 800]);hold all;
    colormap jet;
    if flag
        vidfile = VideoWriter(fullfile('figures', name), 'MPEG-4');
        vidfile.FrameRate = round(1/mean(diff(t)));
        open(vidfile);
    end

    if ~flag
        inc = 3;
    else
        inc = 1;
    end
    colors = ['b', 'r', 'g'];
    for i = 1:inc:length(t)
        clf;
        
        tiledlayout(5,4);
        nexttile(1, [1,4]);hold all;
        ax = gca;
        scatter(mod(y(i,2) - y(i,1), 2*pi) ,  0.5, 100, 'k','filled');
        if abs(OmegaK) < 1
            plot(mod([asin(OmegaK), asin(OmegaK)], 2*pi), [0, 1], 'r', 'linewidth', 2);
            plot(mod([pi - asin(OmegaK), pi-asin(OmegaK)], 2*pi), [0, 1], 'r--', 'linewidth', 2);
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



        nexttile(5, [4,4]);hold all;
        ax = gca;
        t_circ = 0:0.01:2*pi;
        plot(cos(t_circ), sin(t_circ), 'k', 'linewidth', 2);
        ylabel('sin(\theta)', 'FontSize', 20, 'FontWeight','bold');
        xlabel('cos(\theta)', 'FontSize', 20, 'FontWeight','bold');
        xticks([-1, 1]);
        yticks([-1, 1]);
        ax.LineWidth=2;
        ax.FontSize = 20;
        for j = 1:2
            scatter(cos(y(i, j)), sin(y(i, j)), 300, 'filled', colors(j));
            plot([0,cos(y(i, j))], [0, sin(y(i, j))], 'linewidth', 2, 'Color',colors(j));
        end

        box on;
        if flag
            F = getframe(gcf);
            writeVideo(vidfile, F);
        else
            pause(inc*mean(diff(t)));
        end
    end
    if flag
        close(vidfile);
    end


    

end