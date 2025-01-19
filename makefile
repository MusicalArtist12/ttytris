# BC  = /y/shared/Engineering/cs-drbc/cs445/bC

default: run

build/w01-no-precom.bC: src/board.bC src/keybinds.bC src/main.bC src/queue.bC src/spriteUtils.bC src/utils.bC src/gameFunctions.bC
	mkdir -p build
	cpp src/main.bC > build/precompiled.bC
	cat build/precompiled.bC | grep -v "#" > build/w01-no-precom.bC

build/w01.tm: build/w01-no-precom.bC
	$(BC) build/w01-no-precom.bC > build/w01.out
	head -n -2 build/w01.out > build/w01.tm

run: build/w01.tm
	tmbc build/w01.tm

w01.bC: build/w01-no-precom.bC src/heading.txt

	cat src/heading.txt > w01.bC
	cat build/w01-no-precom.bC >> w01.bC

submit: w01.bC
	submit445 w01.bC

clean:
	rm build/*
	rm w01.bC