git clone http://www.github.com/lasalmi/$1.git
cd $1
git submodule init
git submodule update --recursive --remote