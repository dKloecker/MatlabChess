function [friendly_check] = is_dest_piece_friendlly(piece, pieceID, dest_pieceID)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

current_playerID = piece(pieceID).playerID; 

if dest_pieceID == 0
    friendly_check = 0;
else
    dest_playerID = piece(dest_pieceID).playerID;
        if current_playerID == dest_playerID
            friendly_check = 1;
        else
            friendly_check = 0;
        end

end



end

