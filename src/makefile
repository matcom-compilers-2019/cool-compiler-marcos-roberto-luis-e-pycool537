install:
	pip3 install -r requirements.txt

test:
	./tester.sh

compile: 
	./compile.sh test/hello_world.cl

help:
	@echo "make install"
	@echo "    Installs every dependency needed for the project\n"
	@echo "make test"
	@echo "    Test every case on the src/test folder\n"
	@echo "make compile"
	@echo "    Compiles a single file, the src/test/hello_world.cl\n"
