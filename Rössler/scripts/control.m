function u = control(x,xi)
%CONTROL This function generates the control signal for Rössler systems
%synchronization

    global K ue
    
    u = ue - K*(xi - x);
end
