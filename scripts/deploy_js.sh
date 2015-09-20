cd $(dirname $(realpath $0))
cd ..
name=$1.js
plezuro.jar $1 $name
echo '()' >> $name
