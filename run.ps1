rm -R ./ebin/*.*
erlc -o ebin src/potter.erl test/potter_tests.erl
erl -noshell -pa ebin -eval "eunit:test(potter,[verbose])" -s init stop