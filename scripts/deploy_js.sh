cd $(dirname $(realpath $0))
cd ..
name=$1.js
plezuro.jar $1 $name &&
sed -i '$ d' $name &&
echo '})()' >> $name
