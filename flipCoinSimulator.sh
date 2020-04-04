#!/bin/bash -x

echo " Welcome To Flip Coin Simulator"
declare -A singletCombination
declare -A combinationPercentage

function flipCoin() {
	coin=$((RANDOM%2))
	if [ $coin -eq 1 ];
	then
		echo "H"
	else
		echo "T"
	fi
}

function storeSingletCombination() {
	singletCombination["H"]=0
	singletCombination["T"]=0

	for((count=0; count<$1; count++))
	do
		result=$(flipCoin)
		value=${singletCombination[$result]}
		singletCombination[$result]=$((++value))
	done

}

function getCombinationPercentage() {

	for key in ${!singletCombination[@]}
	do
		value=${singletCombination[$key]}
		combinationPercentage[$key]=$(($value*100/$1))
	done
}

#store singlet combination
storeSingletCombination 10
echo ${singletCombination[@]}
echo ${!singletCombination[@]}
#calculate percentage of singlet combination
getCombinationPercentage 10
echo ${combinationPercentage[@]}
echo ${!combinationPercentage[@]}
