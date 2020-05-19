function [movement_validity_queen] = is_move_pattern_valid_queen(piece, board, pieceID, destination)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

current_location = piece(pieceID).location;

current_loaction_m = current_location(1);
current_loaction_n = current_location(2);

allowable_movement = piece(pieceID).move_set;

destination_m = destination(1);
destination_n = destination(2);

required_movement = [destination_m - current_loaction_m, destination_n - current_loaction_n];
%We can check if movement pattern is valid if the abs value of required movement(1) = abs value of required movement(2)

if required_movement(1) == 0 || required_movement(2) == 0 
    straight_check = 1;
    %Get the unit vector of movement 
    unit_vector_movement = required_movement / sum(abs(required_movement));
    %Define the max amount of times the unit vector is timsed for the travel
    %required
    max_times_of_unit_vector = abs(sum(required_movement));
    straight_check = 1;
else
    straight_check = 0;
end

if abs(required_movement(1)) == abs(required_movement(2))
    diagonal_check = 1;
    %Get the unit vector of movement 
    unit_vector_movement = required_movement / abs(required_movement(1));
    %Define the max amount of times the unit vector is timsed for the travel
    %required
    max_times_of_unit_vector = abs(required_movement(1));
else
    diagonal_check = 0;
end

position_taken_check_array = [];

if diagonal_check == 1 || straight_check == 1
    for move = 1:(max_times_of_unit_vector - 1)
        test_coordinates = [current_loaction_m + move * unit_vector_movement(1), current_loaction_n + move * unit_vector_movement(2)];

        [position_check, ~] = position_taken_check(board, test_coordinates);
        if position_check == 1
            position_taken_check_array = [position_taken_check_array position_check]; %#ok<AGROW>
        end
    end
    if isempty(position_taken_check_array) == 1
        %IF test 1 is passed test_1 = 1
        test_1 = 1;
    else 
        test_1 = 0;
    end
else
    test_1 = 0;
end

%After we checked if the path is valid, it is now time to check wether the
%the destination is taken by and enemy
if test_1 == 1
    [position_check, dest_pieceID] = position_taken_check(board, destination);
    [friendly_check] = is_dest_piece_friendlly(piece, pieceID, dest_pieceID);
    
    if position_check == 0
        movement_validity_queen = 1;
    elseif position_check == 1 && friendly_check == 0
        movement_validity_queen = 1;
    else 
        movement_validity_queen = 0;
    end
else 
    movement_validity_queen = 0;
end





end

