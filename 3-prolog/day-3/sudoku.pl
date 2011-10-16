% modify the sudoku printer to work on 6x6 or 9x9 puzzles

valid([]).
valid([Head|Tail]) :-
  fd_all_different(Head),
  valid(Tail).

cell(X,Y,Puzzle,Val) :-
  Pos is (9 * (Y - 1)) + X,
  nth(Pos, Puzzle, Val).


row(Row, Puzzle, [R1,R2,R3,R4,R5,R6,R7,R8,R9]) :-
  cell(1, Row, Puzzle, R1),
  cell(2, Row, Puzzle, R2),
  cell(3, Row, Puzzle, R3),
  cell(4, Row, Puzzle, R4),
  cell(5, Row, Puzzle, R5),
  cell(6, Row, Puzzle, R6),
  cell(7, Row, Puzzle, R7),
  cell(8, Row, Puzzle, R8),
  cell(9, Row, Puzzle, R9).

col(Col, Puzzle, [C1,C2,C3,C4,C5,C6,C7,C8,C9]) :-
  cell(Col, 1, Puzzle, C1),
  cell(Col, 2, Puzzle, C2),
  cell(Col, 3, Puzzle, C3),
  cell(Col, 4, Puzzle, C4),
  cell(Col, 5, Puzzle, C5),
  cell(Col, 6, Puzzle, C6),
  cell(Col, 7, Puzzle, C7),
  cell(Col, 8, Puzzle, C8),
  cell(Col, 9, Puzzle, C9).

square(X1,Y1, Puzzle, [S1,S2,S3,S4,S5,S6,S7,S8,S9]) :-
  X2 is X1 + 1,
  X3 is X1 + 2,
  Y2 is Y1 + 1,
  Y3 is Y1 + 2
  cell(X1,Y1, Puzzle, S1),
  cell(X1,Y2, Puzzle, S2),
  cell(X1,Y3, Puzzle, S3),
  cell(X2,Y1, Puzzle, S4),
  cell(X2,Y2, Puzzle, S5),
  cell(X2,X3, Puzzle, S6),
  cell(X3,Y1, Puzzle, S7),
  cell(X3,Y2, Puzzle, S8),
  cell(X3,Y3, Puzzle, S9).

sudoku(Puzzle, Solution) :-

  Solution = Puzzle,

  Puzzle = [S11,S12,S13,S14,S15,S16,S17,S18,S19,
            S21,S22,S23,S24,S25,S26,S27,S28,S29,
            S31,S32,S33,S34,S35,S36,S37,S38,S39,
            S41,S42,S43,S44,S45,S46,S47,S48,S49,
            S51,S52,S53,S54,S55,S56,S57,S58,S59,
            S61,S62,S63,S64,S65,S66,S67,S68,S69,
            S71,S72,S73,S74,S75,S76,S77,S78,S79,
            S81,S82,S83,S84,S85,S86,S87,S88,S89,
            S91,S92,S93,S94,S95,S96,S97,S98,S99],

  fd_domain(Solution, 1, 4),


  row(1, Puzzle, Row1), row(2, Puzzle, Row2), row(3, Puzzle, Row3), row(4, Puzzle, Row4), row(5, Puzzle, Row5),
  row(6, Puzzle, Row1), row(7, Puzzle, Row2), row(8, Puzzle, Row3), row(9, Puzzle, Row4),

  col(1, Puzzle, Col1), col(2, Puzzle, Col2), col(3, Puzzle, Col3), col(4, Puzzle, Col4), col(5, Puzzle, Col5),
  col(6, Puzzle, Col1), col(7, Puzzle, Col2), col(8, Puzzle, Col3), col(9, Puzzle, Col4),

  square(1,1, Puzzle, Sq1),
  square(1,4, Puzzle, Sq2),
  square(1,7, Puzzle, Sq3),
  square(4,1, Puzzle, Sq4),
  square(4,4, Puzzle, Sq5),
  square(4,7, Puzzle, Sq6),
  square(7,1, Puzzle, Sq7),
  square(7,4, Puzzle, Sq8),
  square(7,7, Puzzle, Sq9),

  valid([Row1,Row2,Row3,Row4,Row5,Row6,Row7,Row8,Row9,
         Col1,Col2,Col3,Col4,Col5,Col6,Col7,Col8,Col9,
         Sq1,Sq2,Sq3,Sq4,Sq5,Sq6,Sq7,Sq8,Sq9]).



