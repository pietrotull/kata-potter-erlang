-module(potter).
-export([price/1]).

% BasePrice = 8.

price(X) -> 8 * calculatePrice(uniqueCount(X),X).

calculatePrice(5, X) -> 
  length(X) * 0.75;
calculatePrice(4, X) -> 
  length(X) * 0.8;
calculatePrice(3, X) -> 
  length(X) * 0.9;
calculatePrice(2, X) -> 
  length(X) * 0.95;
calculatePrice(_, X) -> 
  length(X).

uniqueCount(X) -> length(lists:usort(X)).