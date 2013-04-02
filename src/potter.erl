-module(potter).
-export([price/1]).

  % uniikkine hinta + loput hinta
  % jos tyhjä, return 0
price([]) -> 0;
price(X) ->
  UniqueSet = lists:usort(X),
  calculateSetPrice(UniqueSet) + price(lists:subtract(X, UniqueSet)).

calculateSetPrice(X) ->
  8 * calculatePrice(length(X)).

calculatePrice(5) -> 5 * 0.75;
calculatePrice(4) -> 4 * 0.8;
calculatePrice(3) -> 3 * 0.9;
calculatePrice(2) -> 2 * 0.95;
calculatePrice(_) -> 1.