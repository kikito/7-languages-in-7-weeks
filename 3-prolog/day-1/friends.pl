likes(wallace, cheese).
likes(gromit, cheese).
likes(wendy, cheese).
friend(X,Y) :- \+(X = Y), likes(X, Z), likes(Y,Z).

