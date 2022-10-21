function movie0(flag, name)

    figure('Renderer', 'painters', 'Position', [10 10 1200 600]);hold all;
    colormap jet;
    if flag
        vidfile = VideoWriter(fullfile('figures', name), 'MPEG-4');
        vidfile.FrameRate = 30;
        open(vidfile);
    end

    t = 0:0.01:20;
    f = 2*pi;
    r = 1;
    x = r*cos(f*t);
    y = r*sin(f*t);

    len  = 501;
    shft = 1;

    check1 = false;
    check2 = false;
    check3 = false;
    check4 = false;
    check5 = false;
    check6 = false;
    check7 = false;

    vc = [0,90];
    st  = 150;
    st2 = 330;
    st3 = 510;
    st4 = 690;
    sp = 3;
    j = 0;
    for i = 1:(length(t) - len)
        clf;
        nexttile;
        hold all;
        ax = gca;

        j = j + 1;
        idx = shft*(i-1) + (1:len);
        idx2 = round(median(idx));
        plot3(t(idx), x(idx), y(idx), 'k', 'linewidth', 3);
        scatter3(t(idx2), x(idx2), y(idx2), 300,  [2*abs(mod(t(idx2), 2*pi/f) - pi/f), 2*abs(mod(t(idx2), 2*pi/f) - pi/f), 0.2],  'filled');
        
        xlabel('time', 'FontSize', 20, 'FontWeight','bold');
        ylabel('x=sin(ft)', 'FontSize', 20, 'FontWeight','bold');
        zlabel('y=cos(ft)', 'FontSize', 20, 'FontWeight','bold');
        xticks({});
        yticks({});
        zticks({});


        if (j == st)
            check1 = true;
        end
        if (j == st2)
            check3 = true;
        end
        if (j == st3)
            check5 = true;
        end
        if (j == st4)
            check7 = true;
        end
        if check1 && ~check2
            vc = vc + [0,-sp];
            if vc(2) == 0
                check2 = true;
            end
        end
        if check3 && ~check4
            vc = vc + [sp,0];
            if vc(1) == 90
                check4 = true;
            end
        end
        if check5 && ~check6
            vc = vc + [-sp,sp];
            if vc(1) == 0
                check6= true;
            end
        end
        if check7
            check1 = 0;
            check2 = 0;
            check3 = 0;
            check4 = 0;
            check5 = 0;
            check6 = 0;
            check7 = 0;
            j = 0;
        end

        view(vc);
        axis tight;
        box on;

        nexttile;
        hold all;
        plot3( x(idx), y(idx), t(idx),'k', 'linewidth', 3);
        scatter3(x(idx2), y(idx2), t(idx2), 300, [2*abs(mod(t(idx2), 2*pi/f) - pi/f), 2*abs(mod(t(idx2), 2*pi/f) - pi/f), 0.2], 'filled');
        
        zlabel('time', 'FontSize', 20, 'FontWeight','bold');
        xlabel('x=sin(ft)', 'FontSize', 20, 'FontWeight','bold');
        ylabel('y=cos(ft)', 'FontSize', 20, 'FontWeight','bold');
        xticks({});
        yticks({});
        zticks({});      

        view([35,35])
        axis tight;
        box on;


        if flag
            F = getframe(gcf);
            writeVideo(vidfile, F);
        else
            pause(1/60);
        end
    end


    if flag
        close(vidfile);
    end


    

end