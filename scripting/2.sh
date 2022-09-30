#!/bin/sh
echo "Give the name of the user to KILL and delete:"

while true
do
read username
if id "$username" &>/dev/null; then
	echo "Deleting user"
	break
else
	echo "User not found, please give a proper username:"
done
sudo killall -u $username &>/dev/null
echo "Killed the bastard, mwahahaa"
sudo userdel $username &>/dev/null
echo "Vaporized the user from the whole system"