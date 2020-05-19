function [is_on_board_check] = is_on_board_check(destination)
%Checks if chess move is valid in terms of if it is sitll on the board
%DESTINATION COMES IN m and n

m = destination(1);
n = destination(2);

n_check = 0;
m_check = 0;

if n >= 1 && n <=8
    n_check = 1;
end

if m >= 1 && m <=8
    m_check = 1;
end

move_score = m_check + n_check;

if move_score == 2
    is_on_board_check = 1;
else
    is_on_board_check = 0;
end

end

