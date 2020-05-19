function [piece, board] = move_figure(piece, board, pieceID, destination)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
current_location = piece(pieceID).location;

current_loaction_m = current_location(1);
current_loaction_n = current_location(2);

destination_m = destination(1);
destination_n = destination(2);

[position_check, dest_pieceID] = position_taken_check(board, destination);
[friendly_check] = is_dest_piece_friendlly(piece, pieceID, dest_pieceID);

if position_check == 1
    piece(dest_pieceID).status = 0;
    board.occupant(destination_m, destination_n) = 0;
    piece(dest_pieceID).start_position = 0;
end

board.occupant(current_loaction_m, current_loaction_n) = 0;
board.occupant(destination_m, destination_n) = pieceID;

piece(pieceID).location = [destination_m, destination_n];

end

