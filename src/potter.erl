-module(potter).
-export([price/1]).

  % uniikkine hinta + loput hinta
  % jos tyhjä, return 0
price([]) -> 0;
price(X) ->
  UniqueSet = lists:usort(X),
  get_set_price(length(UniqueSet)) + price(lists:subtract(X, UniqueSet)).

get_set_price(5) -> 8 * 5 * 0.75;
get_set_price(4) -> 8 * 4 * 0.8;
get_set_price(3) -> 8 * 3 * 0.9;
get_set_price(2) -> 8 * 2 * 0.95;
get_set_price(_) -> 8 * 1.