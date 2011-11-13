% find the erlang official website

%   http://www.erlang.org/

% official documentation for erlag's function library

%   http://www.erlang.org/doc/reference_manual/functions.html

% The documentation of Erlang's OTP library

%   http://www.erlang.org/doc/



% write a function that counts the number of words on a string, recursively

-module(day_1).
-export([test/0]).

count_words(Str) -> count_items(string:tokens(Str, " ")).

count_items([]) -> 0;
count_items([_ | Tail]) -> 1 + count_items(Tail).


% write a function that uses recursion to count to ten

count_to_ten() -> count_up(1, 10).

count_up(X,X) -> X;
count_up(X,Y) ->
  io:format("~.10B~n", [X]),
  count_up(X+1, Y).


% write a function that uses matching to selectively print "success" or "error message" given input on the form {error, Message} or success

successful(success) -> io:format("success~n", []);
successful({error, Message}) -> io:format("~s~n", [Message]).


test() ->


  io:format("counting words:~n", []),
  io:format("~.10B~n", [count_words("")]),
  io:format("~.10B~n", [count_words("hello")]),
  io:format("~.10B~n", [count_words("hello brave word")]),

  io:format("~ncounting till ten:~n", []),
  count_to_ten(),

  io:format("~nsuccessful:~n", []),
  successful(success),
  successful({error, "An error message"}).
