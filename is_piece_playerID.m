function [same_ID] = is_piece_playerID(piece, pieceID, playerID)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

selected_playerID = piece(pieceID).playerID; 

if selected_playerID == playerID
    same_ID = 1;
else 
    same_ID = 0;
end




end

