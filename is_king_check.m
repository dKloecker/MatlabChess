function [king1_check,king2_check] = is_king_check(board, piece)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

%player 2 is white
kingID_player2 = 29;
location_player2_king = piece(kingID_player2).location;
king2_check = 0;

%player 1 is black / red
kingID_player1 = 13;
king1_check = 0;
location_player1_king = piece(kingID_player1).location;

[possible_movements_player1, ~, possible_movements_player2,~ ] = get_all_valid_moves(board, piece);

%Check if player 1 is in check 
if ismember(location_player1_king, possible_movements_player2, 'rows') == 1
    king1_check = 1;
    %Get all the possible movements of player1 King, if no movements
    %possible
    
end

if ismember(location_player2_king, possible_movements_player1, 'rows') == 1
    king2_check = 1;
    %Get all the possible movements of player1 King, if no movements
    %possible
    
end


end

