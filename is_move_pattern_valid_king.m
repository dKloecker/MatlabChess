function [movement_validity_king] = is_move_pattern_valid_king(piece, board, pieceID, destination)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
current_location = piece(pieceID).location;
playerID = piece(pieceID).playerID;

current_loaction_m = current_location(1);
current_loaction_n = current_location(2);

allowable_movement = piece(pieceID).move_set;

destination_m = destination(1);
destination_n = destination(2);

required_movement = [destination_m - current_loaction_m, destination_n - current_loaction_n];
%We can check if movement pattern is valid if the abs value of required movement(1) = abs value of required movement(2)

[position_check, dest_pieceID] = position_taken_check(board, destination);
[friendly_check] = is_dest_piece_friendlly(piece, pieceID, dest_pieceID);

if ismember(required_movement, allowable_movement, 'rows') == 1

    if position_check == 0 
            movement_validity_king = 1;
        elseif position_check == 1 && friendly_check == 0
            movement_validity_king = 1;
        else 
            movement_validity_king = 0;
    end

else
    movement_validity_king = 0;
end

end

