% find some prolog tutorials

%  - http://www.learnprolognow.org/
%  - http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/contents.html

% A support forum

%  - http://stackoverflow.com :-)

% An online reference of the prolog version you are using

%  - http://www.gprolog.org/manual/gprolog.html

% make a simple knowledge base of books and authors

author(asimov, robots).
author(asimov, foundation).
author(asimov, the_last_question).
author(ian_m_banks, culture).
author(greg_egan, axiomatic).


% find all books written by one author

%   author(asimov, Book).


% make a kb about musicians and instruments, represent musicians and their genre of music

musician(eric_clapton, guitar).
musician(tim_minchin, piano).
musician(my_cat, mew).

genre(blues, eric_clapton).


% find all musicians who play the guitar

% musician(Name, guitar).
