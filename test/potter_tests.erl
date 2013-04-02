-module(potter_tests).
-include_lib("eunit/include/eunit.hrl").

simple_price_test() ->
  ?assertEqual(0, potter:price([])),
  ?assertEqual(8, potter:price([1])),
  ?assertEqual(8, potter:price([2])),
  ?assertEqual(8, potter:price([3])),
  ?assertEqual(8 * 2, potter:price([0, 0])),
  ?assertEqual(8 * 3, potter:price([1, 1, 1])).

single_discount_price_test() ->
  ?assertEqual(8 * 2 * 0.95, potter:price([0, 1])),
  ?assertEqual(8 * 3 * 0.9, potter:price([0, 2, 4])),
  ?assertEqual(8 * 4 * 0.8, potter:price([0, 1, 2, 4])),
  ?assertEqual(8 * 5 * 0.75, potter:price([0, 1, 2, 3, 4])).
