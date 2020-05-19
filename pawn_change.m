function [piece, board] = pawn_change(piece, board, pawnID, new_pawn_class, movement_tower, movement_knight, movement_horse, movement_queen)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
piece(pawnID).pieceClass = new_pawn_class;

if new_pawn_class == 2
    piece(pawnID).move_set = movement_tower;
elseif new_pawn_class == 3
    piece(pawnID).move_set = movement_horse;
elseif new_pawn_class == 4
    piece(pawnID).move_set = movement_knight;
elseif new_pawn_class == 5
    piece(pawnID).move_set = movement_queen;
end


end

