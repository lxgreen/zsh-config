for i in $(nvr --serverlist)
do
  nvr -c 'source $MYVIMRC' --servername $i
done
