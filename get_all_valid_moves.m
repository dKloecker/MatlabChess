function [possible_movements_player1, piece_for_movement_p1, possible_movements_player2,piece_for_movement_p2 ] = get_all_valid_moves(board, piece)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


move_counter_p1 = 1;
move_counter_p2 = 1;
possible_movements_player1 = [];
possible_movements_player2 = [];
piece_for_movement_p1 = [];
piece_for_movement_p2 = [];

for pieceID = 1:length(piece)

    for m = 1:8
        for n = 1:8
            test_coordinates = [m,n];
            piece_class = piece(pieceID).pieceClass;
            playerID = piece(pieceID).playerID;
            
            if piece_class == 1
                [movement_validity] = is_move_pattern_valid_pawn(piece, board, pieceID, test_coordinates);
            elseif piece_class == 2
                [movement_validity] = is_move_pattern_valid_tower(piece, board, pieceID, test_coordinates);
            elseif piece_class == 3
                [movement_validity] = is_move_pattern_valid_horse(piece, board, pieceID, test_coordinates);
            elseif piece_class == 4
                [movement_validity] = is_move_pattern_valid_knight(piece, board, pieceID, test_coordinates);
            elseif piece_class == 5
                [movement_validity] = is_move_pattern_valid_queen(piece, board, pieceID, test_coordinates);
            elseif piece_class == 6
                [movement_validity] = is_move_pattern_valid_king(piece, board, pieceID, test_coordinates);
            end
            
            if movement_validity == 1
                
                if playerID == 1
                    possible_movements_player1(move_counter_p1,:) = [test_coordinates];
                    piece_for_movement_p1(move_counter_p1,1) = pieceID;
                    move_counter_p1 = move_counter_p1 + 1;
                elseif playerID == 2
                    possible_movements_player2(move_counter_p2,:) = [test_coordinates];
                    piece_for_movement_p2(move_counter_p2,1) = pieceID;
                    move_counter_p2 = move_counter_p2 + 1;
                
                end
            end
        end
    end   
end
end





