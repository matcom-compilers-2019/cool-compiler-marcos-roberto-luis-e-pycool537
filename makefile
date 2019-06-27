.PHONY: cleanbuild cleanpyc test install 
 
.DEFAULT: help
help:
    @echo "make install"
    @echo "       installs all the dependencies"
    @echo "make test"
    @echo "       run tests"

install:
	pip3 install -r requirements.txt
	sudo apt install openjdk-8-jre

test:|cleanpyc
	./test.sh

cleanpyc:
    find . -name '*.pyc' -exec rm --force {} +
    find . -name '*.pyo' -exec rm --force {} +
    name '*~' -exec rm --force  {}

cleanbuild:
    rm --force --recursive build/
    rm --force --recursive dist/
    rm --force --recursive *.egg-info