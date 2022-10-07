function dydt = vector_field_kuramoto_mean_field(~, y, K)
    %=====================================================================%
    % function dydt = vector_field_kuramoto_mean_field(~, y, omega, K)
    % inputs:
    % K     - coupling strength
    %
    %=====================================================================%
    y = y - angle(mean(exp(1j*y)));

    r = abs(mean(cos(y)));
    dydt = -r*K*sin(y);

end