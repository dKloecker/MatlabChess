function [can_change, pawnID] = can_pawn_change(piece)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Black = playerID 1 
%Red = playerID 2

red_pawn_pieceIDs = 17:24;
black_pawn_pieceIDs = 1:8;
can_change = 0;
pawnID = 0;

for red_pawn = red_pawn_pieceIDs
    pawn_location = piece(red_pawn).location;
    pawn_status = piece(red_pawn).status;
    pawn_class = piece(red_pawn).pieceClass;
    
    opposite_board_locations = [1,1;1,2;1,3;1,4;1,5;1,6;1,7;1,8];

    if pawn_status == 1 && pawn_class == 1
        test_1 = 1;
    else
        test_1 = 0;
    end
    
    if ismember(pawn_location, opposite_board_locations, 'rows') == 1 && pawn_status == 1
        can_change = 1;
        pawnID = red_pawn;
    end
end

for black_pawn = black_pawn_pieceIDs
    pawn_location = piece(black_pawn).location;
    pawn_status = piece(black_pawn).status ;
    pawn_class = piece(black_pawn).pieceClass;
    
    opposite_board_locations = [8,1;8,2;8,3;8,4;8,5;8,6;8,7;8,8];

    if pawn_status == 1 && pawn_class == 1
        test_1 = 1;
    else
        test_1 = 0;
    end
    
    if ismember(pawn_location, opposite_board_locations, 'rows') == 1 && test_1 == 1
        can_change = 1;
        pawnID = black_pawn;    
    end
end


end

