% modify the sudoku printer to work on 6x6 or 9x9 puzzles

valid([]).
valid([Head|Tail]) :-
  fd_all_different(Head),
  valid(Tail).

cell(X,Y,Puzzle,Val) :-
  Pos is (4 * (Y - 1)) + X,
  nth(Pos, Puzzle, Val).


row(Row, Puzzle, [R1,R2,R3,R4]) :-
  cell(1, Row, Puzzle, R1),
  cell(2, Row, Puzzle, R2),
  cell(3, Row, Puzzle, R3),
  cell(4, Row, Puzzle, R4).

col(Col, Puzzle, [C1,C2,C3,C4]) :-
  cell(Col, 1, Puzzle, C1),
  cell(Col, 2, Puzzle, C2),
  cell(Col, 3, Puzzle, C3),
  cell(Col, 4, Puzzle, C4).

square(X1,Y1, Puzzle, [S1,S2,S3,S4]) :-
  X2 is X1 + 1,
  Y2 is Y1 + 1,
  cell(X1,Y1, Puzzle, S1),
  cell(X1,Y2, Puzzle, S2),
  cell(X2,Y1, Puzzle, S3),
  cell(X2,Y2, Puzzle, S4).

sudoku(Puzzle, Solution) :-

  Solution = Puzzle,

  fd_domain(Solution, 1, 4),

  row(1, Puzzle, Row1), row(2, Puzzle, Row2), row(3, Puzzle, Row3), row(4, Puzzle, Row4),
  col(1, Puzzle, Col1), col(2, Puzzle, Col2), col(3, Puzzle, Col3), col(4, Puzzle, Col4),

  square(1,1, Puzzle, Sq1),
  square(1,3, Puzzle, Sq2),
  square(3,1, Puzzle, Sq3),
  square(3,3, Puzzle, Sq4),

  valid([Row1,Row2,Row3,Row4,
         Col1,Col2,Col3,Col4,
         Sq1,Sq2,Sq3,Sq4]).

% This is so little dry it makes me want to cry.


