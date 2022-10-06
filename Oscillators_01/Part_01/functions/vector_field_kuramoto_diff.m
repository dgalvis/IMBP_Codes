function dydt = vector_field_kuramoto_diff(~, y, Omega, K)
    
    dydt = Omega - K*sin(y);
end