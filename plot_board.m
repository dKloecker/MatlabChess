function [] = plot_board(piece,board)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

clf('reset')

x = 1:10;
y = 1:10;

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
for pieceID = 1:length(piece)
    current_piece = piece(pieceID);
    current_playerID = current_piece.playerID;
    
    %give pieces color
    if current_playerID == 1
        if current_piece.status == 1
        
        current_location = current_piece.location;
        
        current_y = current_location(1);
        current_x = current_location(2);
        
        upscaled_y = current_y * 1;
        upscaled_x = current_x * 1;
        
        if current_piece.pieceClass == 1
            plot(upscaled_x, upscaled_y, 'ok','LineWidth', 9)
        elseif current_piece.pieceClass == 2
            plot(upscaled_x, upscaled_y, 'sk','LineWidth', 10)    
        elseif current_piece.pieceClass == 3
            plot(upscaled_x, upscaled_y, '+k','LineWidth', 13)    
        elseif current_piece.pieceClass == 4
            plot(upscaled_x, upscaled_y, 'vk','LineWidth', 9)    
        elseif current_piece.pieceClass == 5
            plot(upscaled_x, upscaled_y, '*k','LineWidth', 13)    
        elseif current_piece.pieceClass == 6
            plot(upscaled_x, upscaled_y, 'dk','LineWidth', 10)    
        end
        end
        
    else
        if current_piece.status == 1
        
        current_location = current_piece.location;
        
        current_y = current_location(1);
        current_x = current_location(2);
        
        upscaled_y = current_y * 1;
        upscaled_x = current_x * 1;
        
        if current_piece.pieceClass == 1
            plot(upscaled_x, upscaled_y, 'or','LineWidth', 9)
        elseif current_piece.pieceClass == 2
            plot(upscaled_x, upscaled_y, 'sr','LineWidth', 10)    
        elseif current_piece.pieceClass == 3
            plot(upscaled_x, upscaled_y, '+r','LineWidth', 13)    
        elseif current_piece.pieceClass == 4
            plot(upscaled_x, upscaled_y, 'vr','LineWidth', 9)    
        elseif current_piece.pieceClass == 5
            plot(upscaled_x, upscaled_y, '*r','LineWidth', 13)    
        elseif current_piece.pieceClass == 6
            plot(upscaled_x, upscaled_y, 'dr','LineWidth', 10)    
        end
        end
    end
end



end

