function movie1(t, y, flag, name, omega)
    if nargin < 5
        omega = [];
    end
    figure('Renderer', 'painters', 'Position', [10 10 600 600]);hold all;
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
        hold all;
        ax = gca;
        t_circ = 0:0.01:2*pi;
        plot(cos(t_circ), sin(t_circ), 'k', 'linewidth', 2);
        ylabel('sin(\theta)', 'FontSize', 20, 'FontWeight','bold');
        xlabel('cos(\theta)', 'FontSize', 20, 'FontWeight','bold');
        xticks([-1, 1]);
        yticks([-1, 1]);
        ax.LineWidth=2;
        ax.FontSize = 20;
        if size(y, 2) <= 3
            for j = 1:size(y,2)
                scatter(cos(y(i, j)), sin(y(i, j)), 300, 'filled', colors(j));
            end
        else
            scatter(cos(y(i, :)), sin(y(i, :)), 100, omega, 'filled');
            kur = mean(cos(y(i, :))) + 1j*mean(sin(y(i,:)));
            ang = angle(kur);
            len = norm(kur);
            plot([0, len*cos(ang)], [0, len*sin(ang)], 'b','linewidth', 2);
            scatter(len*cos(ang), len*sin(ang), 100, 'filled', 'b');

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