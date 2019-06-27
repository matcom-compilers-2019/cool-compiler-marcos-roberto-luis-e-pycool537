default: test.sh

test.sh:
    ./test.sh

help: 
    @echo "make install"
    @echo "       installs all the dependencies"
    @echo "make test"
    @echo "       run tests"

install.sh: requirements.txt
    pip3 install -r requirements.txt
    sudo apt install openjdk-8-jre


cleanpyc: 
    find . -name '*.pyc' -exec rm --force {} +
    find . -name '*.pyo' -exec rm --force {} +
    name '*~' -exec rm --force  {}

cleanbuild: 
    rm --force --recursive build/
    rm --force --recursive dist/
    rm --force --recursive *.egg-info
