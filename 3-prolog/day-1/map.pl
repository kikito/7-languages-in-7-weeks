d(red,green).
d(red,blue).
d(green,red).
d(green,blue).
d(blue,red).
d(blue,green).
coloring(A, M, G, T, F) :-
  d(M,T),d(M,A),
  d(A,T),d(A,M),d(A,F),d(A,G),
  d(G,F),d(G,T).
