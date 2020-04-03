#!/bin/bash -x

echo "Flip Coin Simulator"

function flipCoin() {
	coin=$((RANDOM%2))
	if [ $coin -eq 1 ];
	then
		echo "HEAD"
	else
		echo "TAIL"
	fi
}

#call function for fliping coin
flipCoin
