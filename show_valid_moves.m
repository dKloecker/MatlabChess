function [] = show_valid_moves(possible_movements)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


figure(1)
xline(0.5);
xline(1.5);
xline(2.5);
xline(3.5);
xline(4.5);
xline(5.5);
xline(6.5);
xline(7.5);
xline(8.5);
yline(0.5);
yline(1.5);
yline(2.50);
yline(3.50);
yline(4.50);
yline(5.50);
yline(6.50);
yline(7.50);
yline(8.50);
hold all

size_p_movements = size(possible_movements);

if size_p_movements(1) >= 1
    for move = 1:size_p_movements(1)
        
        coords = possible_movements(move,:);
        x = coords(2);
        y = coords(1);
        
        plot(x, y, 'oy','LineWidth',4)
        
        
        
    end
end

    

    
    


end

