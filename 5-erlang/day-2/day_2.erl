-module(day_2).
-export([test/0]).

% consider a list of keyword-value tuples, such as [{erlang, "a functional lang"}, {ruby, "an OO lang"}]
% write a function that accepts the list and a keyword and returns the associated value for the keyword

dictionary_get(List, Name) ->
  [{_, Description}|_] = lists:filter(fun({Language,_}) -> Language == Name end, List),
  Description.


% consider a shopping list that looks like this: [{item quantity price}, ...]. Write a list comprehension
% that builds a list of items in the form [{item total_price}, ...] where total_price is quantity times price

shopping_list(List) ->
  [{Item, Quantity * Price} || {Item, Quantity, Price}  <- List].


test() ->

  io:format("dictionary_get:~n",[]),
  Dict = [{erlang, "a functional lang"}, {ruby, "an OO lang"}],
  io:format("~s~n", [dictionary_get(Dict, ruby)]),

  io:format("~nshopping list:~n:", []),
  List = [{bananas, 2, 10}, {oranges, 10, 5}],
  shopping_list(List).
