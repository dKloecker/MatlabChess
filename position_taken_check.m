function [position_check, dest_pieceID] = position_taken_check(board, destination)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

destination_m = destination(1);
destination_n = destination(2);

if board.occupant(destination_m, destination_n) == 0
    position_check = 0;
    dest_pieceID = 0;
else
    position_check = 1;
    dest_pieceID = board.occupant(destination_m, destination_n);
end



end

