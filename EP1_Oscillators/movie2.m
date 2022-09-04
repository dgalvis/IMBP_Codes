function movie2(t, y, flag, name, omega)
    figure('Renderer', 'painters', 'Position', [10 10 600 600]);hold all;
    colormap jet;
    if flag
        vidfile = VideoWriter(fullfile('figures', name), 'MPEG-4');
        vidfile.FrameRate = round(1/mean(diff(t)));
        open(vidfile);
    end
    if max(omega) > 10 && min(omega) < -10
        list_omega = -10:0.1:10;
    else
        list_omega = linspace(min(omega), max(omega), 201);
    end
    list_angles = 0:(2*pi/100):2*pi;
    x = abs(list_omega - omega);
    [~, idx_omega] = min(x,[],2);
    y = mod(y, 2*pi);

    [a, o] = meshgrid(list_angles, list_omega);
    H = zeros(size(y,1), length(list_omega), length(list_angles));

    for i = 1:length(t)
        y_aux = y(i, :)';
        x = abs(list_angles - y_aux);
        [~, idx_angles] = min(x,[],2);
        for j = 1:size(y_aux)
            H(i, idx_omega(j), idx_angles(j)) = H(i, idx_omega(j), idx_angles(j)) + 1;
        end
    end
    H = H/max(H(:));

    for i = 1:length(t)
        clf;
        hold all;
        ax = gca;
        pcolor(a(2:end-1, :), o(2:end-1, :), squeeze(H(i,2:end-1,:)));
        caxis([0, 0.1]);
        %xticks([min(list_omega), max(list_omega)])
        xticks([0, 2*pi]);
        xlim([0, 2*pi]);
        xticklabels({'0', '2\pi'})
        ylabel('\omega_i', 'FontSize', 20, 'FontWeight','bold');
        xlabel('\theta_i', 'FontSize', 20, 'FontWeight','bold');
        ax.LineWidth=2;
        ax.FontSize = 20;
        box on;
        axis tight;
        shading interp;
        if flag
            F = getframe(gcf);
            writeVideo(vidfile, F);
        else
            pause(mean(diff(t)));
        end
    end
    if flag
        close(vidfile);
    end
end

    