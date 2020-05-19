function [possible_movements] = get_all_valid_moves_for_piece(board, piece, pieceID)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


move_counter = 1;
possible_movements = [];
for m = 1:8
    for n = 1:8
        test_coordinates = [m,n];
        piece_class = piece(pieceID).pieceClass;

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
            %Move the figure
            %Create an alternative state to see wether king would be in
            %check through this move
            playerID = piece(pieceID).playerID;
            test_piece = piece;
            test_board = board;
            
            [test_piece, test_board] = move_figure(test_piece, test_board, pieceID, test_coordinates);
            test_piece(pieceID).start_position = 0;

            [king1_check_test,king2_check_test] = is_king_check(test_board, test_piece);
            king_checks = [king1_check_test,king2_check_test];
            %Check for the current_friendly_king
            rel_king_check = king_checks(playerID);

            if rel_king_check == 0
                possible_movements(move_counter,:) = [test_coordinates];
                move_counter = move_counter + 1;
            else
            end    
        end


    end   
end


end

