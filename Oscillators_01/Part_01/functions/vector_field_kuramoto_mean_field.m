function dydt = vector_field_kuramoto_mean_field(~, y, K, flag)
    %=====================================================================%
    % function dydt = vector_field_kuramoto_mean_field(~, y, omega, K)
    % inputs:
    % K     - coupling strength
    %
    %=====================================================================%
    if flag
        y = y - angle(mean(exp(1j*y)));
    end
    r = abs(mean(cos(y)));
    dydt = -r*K*sin(y);

end