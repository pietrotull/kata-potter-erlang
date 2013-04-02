-module(potter).
-export([price/1]).

price([]) -> 0;
price(X) ->
  NextSet = get_next_set(X),
  get_set_price(length(NextSet)) + price(lists:subtract(X, NextSet)).

get_next_set(X) ->
  ThisSet = lists:usort(X),
  NextSet = lists:subtract(X, ThisSet),
  case length(NextSet) == 3 of
    true -> 
      tl(lists:reverse(ThisSet));
    false -> 
      ThisSet
  end.

get_set_price(5) -> 8 * 5 * 0.75;
get_set_price(4) -> 8 * 4 * 0.8;
get_set_price(3) -> 8 * 3 * 0.9;
get_set_price(2) -> 8 * 2 * 0.95;
get_set_price(_) -> 8 * 1.