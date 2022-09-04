function dydt = vector_field_kuramoto(~, y, omega, K)
    %=====================================================================%
    % function dydt = vector_field_kuramoto(~, y, omega, K)
    % inputs:
    % omega - N x 1 vector of intrinsic frequencies
    % K     - coupling strength
    %
    %=====================================================================%
    % number of oscillators
    N = length(y);

    % all-to-all connectivity (no self connections)
    A = ones(length(y));
    A = A - eye(size(A));
    
    
    dydt = omega + K/N * sum(A.* sin(y' - y), 2);
end