function [movement_validity_pawn] = is_move_pattern_valid_pawn(piece, board, pieceID, destination)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

current_location = piece(pieceID).location;

current_loaction_m = current_location(1);
current_loaction_n = current_location(2);

allowable_movement = piece(pieceID).move_set;
start_movement = piece(pieceID).start_move;
attack_movement = piece(pieceID).attack_move;

destination_m = destination(1);
destination_n = destination(2);

required_movement = [destination_m - current_loaction_m, destination_n - current_loaction_n];

[position_check, dest_pieceID] = position_taken_check(board, destination);
[friendly_check] = is_dest_piece_friendlly(piece, pieceID, dest_pieceID);

if position_check == 0
    %Movement if position is not taken
    if ismember(required_movement, allowable_movement, 'rows') == 1
        
       movement_validity_pawn = 1;

    elseif piece(pieceID).start_position == 1 && ismember(required_movement, start_movement, 'rows') == 1
        %Check if paths is blocked
        block_test_destination = destination - 0.5 * required_movement;
        [path_position_check, ~] = position_taken_check(board, block_test_destination);
        if path_position_check == 0
            movement_validity_pawn = 1;
        else
            movement_validity_pawn = 0;
        end
        %Check if paths is blocked
        
    else
        movement_validity_pawn = 0;
    end

    %Movement if position is taken by friendly
elseif  position_check  == 1 && friendly_check == 1

    movement_validity_pawn = 0; 
    %Movement if position is taken by hostile
else
    if position_check == 1 && friendly_check == 0
        if ismember(required_movement, attack_movement, 'rows') == 1
            movement_validity_pawn = 1;
        else
            movement_validity_pawn = 0;
        end
    end

end



end

