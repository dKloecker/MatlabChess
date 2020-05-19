function [movement_validity_king, piece, board, tower_id, tower_new_location] = can_king_caslte(piece, board, pieceID, destination)
%   Detailed explanation goes here
playerID = piece(pieceID).playerID;
movement_validity_king = 0;
tower_id = 0;
tower_new_location = 0;

if playerID == 1
    if ismember(destination, [1, 7], 'rows') == 1
        
        %Introduce all nessecary tests for casteling
        king_move_status = piece(pieceID).start_position;
        rock_move_status = piece(16).start_position;
        
        movement_score = king_move_status + rock_move_status;

        [king1_check,~] = is_king_check(board, piece);
        
        path_occupants = [board.occupant(1,6:7)];
        
        path_score = sum(path_occupants);
        
        if movement_score == 2 && sum(path_score + king1_check) == 0
            %Declare a test to see if king would move through check
            alt_board = board;
            alt_piece = piece;
            alt_pieceID = pieceID;
            [alt_piece, alt_board] = move_figure(alt_piece, alt_board, alt_pieceID, [1,6]);
            [king1_alt_check,~] = is_king_check(alt_board, alt_piece);
            if king1_alt_check == 0
                movement_validity_king = 1;
                tower_id = 16;
                tower_new_location = [1,6];

            end

        end
        
elseif ismember(destination, [1, 3], 'rows') == 1
        
    %Introduce all nessecary tests for casteling
    king_move_status = piece(pieceID).start_position;
    rock_move_status = piece(9).start_position;

    movement_score = king_move_status + rock_move_status;

    [king2_check,~] = is_king_check(board, piece);

    path_occupants = [board.occupant(1,2:4)];

    path_score = sum(path_occupants);

    if movement_score == 2 && sum(path_score + king2_check) == 0
        %Declare a test to see if king would move through check
        alt_board = board;
        alt_piece = piece;
        alt_pieceID = pieceID;
        [alt_piece, alt_board] = move_figure(alt_piece, alt_board, alt_pieceID, [1,4]);
        [king1_alt_check,~] = is_king_check(alt_board, alt_piece);
        if king1_alt_check == 0
            movement_validity_king = 1;
            tower_id = 9;
            tower_new_location = [1,4];
        end

    end
        
        
    end
    
elseif playerID == 2
    if ismember(destination, [8, 7], 'rows') == 1
        %Introduce all nessecary tests for casteling
        king_move_status = piece(pieceID).start_position;
        rock_move_status = piece(32).start_position;
        
        movement_score = king_move_status + rock_move_status;

        [~,king2_check] = is_king_check(board, piece);
        
        path_occupants = [board.occupant(8,6:7)];
        
        path_score = sum(path_occupants);
        
        if movement_score == 2 && sum(path_score + king2_check) == 0
            %Declare a test to see if king would move through check
            alt_board = board;
            alt_piece = piece;
            alt_pieceID = pieceID;
            [alt_piece, alt_board] = move_figure(alt_piece, alt_board, alt_pieceID, [8,6]);
            [~,king2_alt_check] = is_king_check(alt_board, alt_piece);
            if king2_alt_check == 0
                movement_validity_king = 1;
                tower_id = 32;
                tower_new_location = [8,6];
            end

        end
        
    elseif ismember(destination, [8, 3], 'rows') == 1
        
        %Introduce all nessecary tests for casteling
        king_move_status = piece(pieceID).start_position;
        rock_move_status = piece(25).start_position;
        
        movement_score = king_move_status + rock_move_status;

        [~,king2_check] = is_king_check(board, piece);
        
        path_occupants = [board.occupant(8,2:4)];
        
        path_score = sum(path_occupants);
        
        if movement_score == 2 && sum(path_score + king2_check) == 0
            %Declare a test to see if king would move through check
            alt_board = board;
            alt_piece = piece;
            alt_pieceID = pieceID;
            [alt_piece, alt_board] = move_figure(alt_piece, alt_board, alt_pieceID, [8,4]);
            [~,king2_alt_check] = is_king_check(alt_board, alt_piece);
            if king2_alt_check == 0
                movement_validity_king = 1;
                tower_id = 25;
                tower_new_location = [8,4];
            end

        end
        
    end

else
    movement_validity_king = 0;
end

end

