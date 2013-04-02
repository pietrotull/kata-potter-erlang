-module(potter_tests).
-include_lib("eunit/include/eunit.hrl").


no_discounts_test() ->
  ?assertEqual(0, potter:price([])),
  ?assertEqual(8, potter:price([1])),
  ?assertEqual(8, potter:price([2])),
  ?assertEqual(8, potter:price([3])),
  ?assertEqual(8 * 2, potter:price([0, 0])),
  ?assertEqual(8 * 3, potter:price([1, 1, 1])).

single_discount_set_test() ->
  ?assertEqual(8 * 2 * 0.95, potter:price([0, 1])),
  ?assertEqual(8 * 3 * 0.9, potter:price([0, 2, 4])),
  ?assertEqual(8 * 4 * 0.8, potter:price([0, 1, 2, 4])),
  ?assertEqual(8 * 5 * 0.75, potter:price([0, 1, 2, 3, 4])).

several_discountsets_test() ->
  ?assertEqual(8 + (8 * 2 * 0.95), potter:price([0, 0, 1])),
  ?assertEqual(2 * (8 * 2 * 0.95), potter:price([0, 0, 1, 1])),
  ?assertEqual((8 * 4 * 0.8) + (8 * 2 * 0.95), potter:price([0, 0, 1, 2, 2, 3])),
  ?assertEqual(8 + (8 * 5 * 0.75), potter:price([0, 1, 1, 2, 3, 4])).