function [king1_check_mate,king2_check_mate] = is_king_check_mate(piece,board)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%player 2 is white

%Creae alternative game states to check through possibilities 

kingID_player2 = 29;
king2_save_array = [];


%player 1 is black / red
kingID_player1 = 13;
king1_save_array = [];

[possible_movements_player1, piece_for_movement_p1, possible_movements_player2,piece_for_movement_p2 ] = get_all_valid_moves(board, piece);

for moves_p1 = 1:length(possible_movements_player1)
    alt_pieces = piece;
    alt_board = board;
    pieceID = piece_for_movement_p1(moves_p1);
    destination = possible_movements_player1(moves_p1,:);
    [alt_pieces, alt_board] = move_figure(alt_pieces, alt_board, pieceID, destination);
    
    [king1_check,~] = is_king_check(alt_board, alt_pieces);
    
    if king1_check == 0
        king1_save_array = pieceID;
    end 
end

for moves_p2 = 1:length(possible_movements_player2)
    alt_pieces = piece;
    alt_board = board;
    pieceID = piece_for_movement_p2(moves_p2);
    destination = possible_movements_player2(moves_p2,:);
    [alt_pieces, alt_board] = move_figure(alt_pieces, alt_board, pieceID, destination);
    
    [~,king2_check] = is_king_check(alt_board, alt_pieces);
    
    if king2_check == 0
        king2_save_array = pieceID;
    end  
end

if isempty(king1_save_array) == 1
    king1_check_mate = 1;
else 
    king1_check_mate = 0;
end

if isempty(king2_save_array) == 1
    king2_check_mate = 1;
else 
    king2_check_mate = 0;
end

end

