echo "Please make your tunnel selection:"
echo "1)To Apache"
echo "2)To Deluge"
echo "3)Both"
while :; do
	read -rsn1 selection
  case "$selection" in 
    1|2|3) break ;;
    *) ;;
  esac
done

if [ "$selection" == "1" ]; then
	if [ ssh -N -L 8181:localhost:80 debian@localhost & > 0]; then
		echo "Tunnel to Apache failed!"
	else
		echo "Tunnel to Apache port 80 established on port 8181"
	fi

elif [ "$selection" == "2" ]; then
	if [ ssh -N -L 8190:localhost:8112 debian@localhost & > 0]; then
		echo "Tunnel to Deluge failed!"
	else
		echo "Tunnel to Deluge port 8112 established on port 8190"
	fi

elif [ "$selection" == "3" ]; then
	ssh -N -L 8190:localhost:8112 debian@localhost &
	ssh -N -L 8181:localhost:80 debian@localhost &
	echo "Tunnel to Apache at 8181 and to Deluge at 8190"
fi