%Define different chess pieces
clear;
clc;

%Define the size of each chess field, for lates use if higher res is needed
%for graphics
field_size = 1;

for m = 1:8
    for n = 1:8
        %first create the field
        board.field(m, n) = 1;
        %Now assign Colors i.e. black and white to the right locations
        %Black = -1, White = 1
        color_value = 1 *(-1)^n*(-1)^m;
        board.color(m, n) = color_value;
        board.occupant = [];
    end
end
%Declare movement sets
movement_pawn_black = [1, 0];
star_movemnts_black_pawn = [2, 0];
attack_move_black_pawn = [1, 1; 1, -1;];

movement_pawn_white = [-1, 0];
star_movemnts_white_pawn = [-2, 0];
attack_move_white_pawn = [-1, 1; -1, -1;];

movement_tower = [1,0; 0, 1; -1, 0; 0, -1];
movement_knight = [1,1; 1,-1; -1,1; -1, -1];
movement_horse = [2,1; 2,-1; 1, 2; 1, -2; -2, 1; -2, -1; -1, 2; -1, -2 ];
movement_queen = [movement_tower; movement_knight];
movement_king = [movement_tower; movement_knight];


%This look initiates all the pieces on the chess board alongside allocating
%them the right starter location, piece class and played type 
for pieceID = 1:32
    if pieceID <= 16
        piece(pieceID).playerID = 1; %#ok<*SAGROW> 
    else
        piece(pieceID).playerID = 2;
    end
    
    %Declare the piece to be at starting position, for later pawn movemnt
    piece(pieceID).start_position = 1;
    %Declare an active state to the pieces
    piece(pieceID).status = 1;
    
    %Declare start Location 
    %Declare type of chess piece
    %Piece Classes: Pawn: 1, tower: 2, horse: 3, knight: 4, queen: 5, 
    % King: 6
    %After declaring the class, allocate an allowable move set aswell as
    %special move sets
    %When initiating pieces, also put the piece ID on the board
    
    %----------------------------------------------------------%
    % WHITE FIFURES 
    %----------------------------------------------------------%
    
    if pieceID <= 8 
        %BLACK PAWNS
        piece(pieceID).location = [ 2, pieceID];
        board.occupant(2, pieceID) = pieceID;
        piece(pieceID).pieceClass = 1;
        %Pawns can normally move 1 ahead, not sideways
        %If pawns are in stat position, they can also move 2 ahead
        piece(pieceID).move_set = movement_pawn_black;
        piece(pieceID).start_move = star_movemnts_black_pawn;
        piece(pieceID).attack_move = attack_move_black_pawn;
        
    elseif pieceID > 8 && pieceID <= 16
        piece(pieceID).location = [1,  (pieceID-8)];
        board.occupant(1, (pieceID-8)) = pieceID;
        
        if pieceID == 9 || pieceID == 16
            %BLACK TOWER
            piece(pieceID).pieceClass = 2;
            piece(pieceID).move_set = movement_tower;
        elseif pieceID == 10 || pieceID == 15
            %BLACK HORSE
            piece(pieceID).pieceClass = 3;
            piece(pieceID).move_set = movement_horse;
        elseif pieceID == 11 || pieceID == 14
            %BLACK KNIGHT
            piece(pieceID).pieceClass = 4;
            piece(pieceID).move_set = movement_knight;
        elseif pieceID == 12
            %BLACK QUEEN
            piece(pieceID).pieceClass = 5;
            piece(pieceID).move_set = movement_queen;
        elseif pieceID == 13
            %BLACK KING
            piece(pieceID).pieceClass = 6;
            piece(pieceID).move_set = movement_king;
       
        
        end
        
    %----------------------------------------------------------%
    % WHITE FIFURES 
    %----------------------------------------------------------%

    elseif pieceID > 16 && pieceID <= 24
        %WHITE PAWNS
        piece(pieceID).location = [7,  (pieceID-16)]; 
        board.occupant(7, (pieceID-16)) = pieceID;
        piece(pieceID).pieceClass = 1;
        
        piece(pieceID).move_set = movement_pawn_white;
        piece(pieceID).start_move = star_movemnts_white_pawn;
        piece(pieceID).attack_move = attack_move_white_pawn;
        
        
    elseif pieceID > 24 && pieceID <= 32
        piece(pieceID).location = [8,  (pieceID-24)]; 
        board.occupant(8, (pieceID-24)) = pieceID;
        
        if pieceID == 25 || pieceID == 32
            %White tower
            piece(pieceID).pieceClass = 2;
            piece(pieceID).move_set = movement_tower;
        elseif pieceID == 26 || pieceID == 31
            %WHITE HORSE
            piece(pieceID).pieceClass = 3;
            piece(pieceID).move_set = movement_horse;
        elseif pieceID == 27 || pieceID == 30
            %WHITE KNIGHT
            piece(pieceID).pieceClass = 4;
            piece(pieceID).move_set = movement_knight;
        elseif pieceID == 28
            %WHITE QUEEN
            piece(pieceID).pieceClass = 5;
            piece(pieceID).move_set = movement_queen;
        elseif pieceID == 29
            %WHITE KING
            piece(pieceID).pieceClass = 6;
            piece(pieceID).move_set = movement_king;
        end
  

    end   
end

%The pieceIDs of the white King is 13 and Black king is 29]
%Declare a is in check status for the kings to determine wether they are
%check mate
piece(13).check_mate = 0;
piece(29).check_mate = 0;

%declare a game running state; 1 =  True, 0 = False
game_running = 1;

%Start with white i.e. playedID = 2
playerID = 2;
fprintf('To play this game, please select coordinates of pieces you want to choose\n')
fprintf('Coordinate choices works over typing [y,x].\nIt is important that you type in the square brackets and type in coordinates only as integers\n')   
fprintf('Coordinates are represented on the plot\n')
fprintf('RED Starts\n')
fprintf('IF GAME BREAKS: Type in 101010  to terminate \n')

while game_running == 1
    
    [can_change, pawnID] = can_pawn_change(piece);
    if can_change == 1
        valid_input_pawn_change = 0;
        prompt_pawn = 'Pawn can switch piece type, select what piece you want the pawn to become.\n Enter 2 for rook, 3 for knight, 4 for bishop, 5 for queen: ';
        while valid_input_pawn_change == 0
            new_pawn_class = input(prompt_pawn);
            if ismember(new_pawn_class, [2; 3; 4; 5], 'rows') == 1
                valid_input_pawn_change = 1;
            else
                fprintf('Invalid class, please try again')
            end
        end
        
        [piece, board] = pawn_change(piece, board, pawnID, new_pawn_class, movement_tower, movement_knight, movement_horse, movement_queen);
        valid_input_pawn_change = 0;
    end    
    
    clf('reset')
    plot_board(piece,board)
    
    %Check if kings are in check mate, if so break game and declare winner
    [king1_check,king2_check] = is_king_check(board, piece);
    
 
    if king1_check == 1
        [king1_check_mate,king2_check_mate] = is_king_check_mate(piece,board);
        if king1_check_mate == 1
            fprintf('RED Wins (CHECKMATE)\n')
            game_running = 0;
            break
        else
            fprintf('Black King is check\n')
        end
    end
    
    if king2_check == 1
        [king1_check_mate,king2_check_mate] = is_king_check_mate(piece,board);
        if king2_check_mate == 1
            fprintf('Black Wins (CHECKMATE)\n')
            game_running = 0;
            break
        else
            fprintf('Red King is check\n')
        end
    end
    
    %-------------------------------------------------------------%
    %--------------------------Initial Piece Choice---------------%
    %-------------------------------------------------------------%
    valid_input = 0;
    while valid_input == 0
        prompt = 'Choose the piece as such [m, n]:      ';
        figure_input = input(prompt);
        
        if figure_input == 101010
            break 
        end
        
        [is_on_board] = is_on_board_check(figure_input);
        
        if is_on_board == 1
            figure_input_m = figure_input(1);
            figure_input_n = figure_input(2);
            pieceID = board.occupant(figure_input_m,figure_input_n);
            
            if pieceID ~= 0
                [same_ID] = is_piece_playerID(piece, pieceID, playerID);
                if same_ID == 1
                    
                    oboard_and_sameID_check = 1;
                    
                else
                    oboard_and_sameID_check = 0;
                end
            else
                oboard_and_sameID_check = 0;
            end
                
            
        else
            oboard_and_sameID_check = 0;
        end
        
        %If these conditions are met, declare input as valid and break loop
        if oboard_and_sameID_check == 1 
            [move_possible_check] = get_all_valid_moves_for_piece(board, piece, pieceID);
            if isempty(move_possible_check) == 0
                valid_input = 1;
            else
                fprintf('CHOSEN PIECE HAS NO POSSIBLE MOVES, PLEASE CHOOSE ANOTHER\n')
            end
        else 
            fprintf('CHOSEN PIECE IS NOT VALID, PLEASE CHOOSE ANOTHER\n')
        end
        
    end
    valid_input = 0;
    if figure_input == 101010
        break 
    end
    %Get the pieceID of the chosen piece
    piece_class = piece(pieceID).pieceClass;
    [possible_movements] = get_all_valid_moves_for_piece(board, piece, pieceID);
    show_valid_moves(possible_movements)
    %-------------------------------------------------------------%
    %---------------------PLAYER MOVEMENT CHOICE------------------%
    %-------------------------------------------------------------%
    
    valid_second_input = 0;
    while valid_second_input == 0
        prompt2 = 'Choose the destination [m, n]:      ';
        destination = input(prompt2);
        
        if destination == 101010
            break 
        end
        [is_on_board] = is_on_board_check(destination);
        
        %Check if destination is on board
        if is_on_board == 1
            
            %Check if the move is valid
            if piece_class == 1
                [movement_validity] = is_move_pattern_valid_pawn(piece, board, pieceID, destination);
            elseif piece_class == 2
                [movement_validity] = is_move_pattern_valid_tower(piece, board, pieceID, destination);
            elseif piece_class == 3
                [movement_validity] = is_move_pattern_valid_horse(piece, board, pieceID, destination);
            elseif piece_class == 4
                [movement_validity] = is_move_pattern_valid_knight(piece, board, pieceID, destination);
            elseif piece_class == 5
                [movement_validity] = is_move_pattern_valid_queen(piece, board, pieceID, destination);
            elseif piece_class == 6
                [movement_validity] = is_move_pattern_valid_king(piece, board, pieceID, destination);
                if movement_validity == 0
                    [movement_validity, piece,board, tower_id, tower_new_location] = can_king_caslte(piece, board, pieceID, destination);
                    [piece, board] = move_figure(piece, board, tower_id, tower_new_location);
                end
            end    

        else
            movement_validity = 0;
        end
        
        if movement_validity == 1
            %Move the figure
            %Create an alternative state to see wether king would be in
            %check through this move
            test_piece = piece;
            test_board = board;
            
            [test_piece, test_board] = move_figure(test_piece, test_board, pieceID, destination);
            test_piece(pieceID).start_position = 0;
            
            [king1_check_test,king2_check_test] = is_king_check(test_board, test_piece);
            king_checks = [king1_check_test,king2_check_test];
            %Check for the current_friendly_king
            rel_king_check = king_checks(playerID);
            
            if rel_king_check == 0
                valid_second_input = 1;
            else
                fprintf('Move not valid because King in check\n')
            end
               
        else 
            fprintf('CHOSEN DESTINATION IS NOT VALID, PLEASE TRY AGAIN\n')
        end
 
    end
    
    if destination == 101010
        break 
    end
    
    valid_second_input = 0;
    
    %Move the figure
    [piece, board] = move_figure(piece, board, pieceID, destination);
    piece(pieceID).start_position = 0;
    
    if playerID == 1
        playerID = 2;
        fprintf('Red moves\n')
    elseif playerID == 2
        playerID = 1;
        fprintf('Black moves\n')
    end
        
end
