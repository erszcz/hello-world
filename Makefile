.PHONY: ps erl all run

PURS := /Users/erszcz/work/purerl/purescript/.stack-work/install/x86_64-osx/lts-8.5/8.0.2/bin/purs

all: ps erl

ps:
	psc-package sources | xargs $(PURS) compile 'src/**/*.purs'

erl:
	mkdir -p ebin
	erlc -o ebin/ output/*/*.erl

run:
	erl -pa ebin -noshell -eval '(main@ps:main@c())()' -eval 'init:stop()'
