#!/bin/bash -x

echo "Welcome To Flip Coin Simulator"
declare -A singletCombination
declare -A doubletCombination
declare -A tripletCombination
declare -A percentage
count=0

function flipCoin() {
	if [ $((RANDOM%2)) -eq 1 ];
   then
   	echo "H"
   else
   	echo "T"
   fi
}

function getSingletPercentage() {
   for key in ${!singletCombination[@]}
   do
      value=${singletCombination[$key]}
      percentage[$key]=$((value*100/numberOfTime))
   done
}

function storeSingletCombination() {
   singletCombination["H"]=0
   singletCombination["T"]=0
   while [ $count != $numberOfTime ]
   do
      result=$( flipCoin )
      value=${singletCombination[$result]}
      singletCombination[$result]=$((++value))
      ((count++))
   done
}

function getDoubletPercentage() {
   for key in ${!doubletCombination[@]}
   do
      value=${doubletCombination[$key]}
      percentage[$key]=$((value*100/numberOfTime))
   done
}

function storeDoubletCombination() {
   for((i=0; i<$numberOfTime; i++))
   do
      count=0
      result=""
      while [ $count != 2 ]
      do
         result+=$( flipCoin )
         ((count++))
      done
      value=${doubletCombination[$result]}
      doubletCombination[$result]=$((++value))
   done
}

function getTripletPercentage() {
   for key in ${!tripletCombination[@]}
   do
      value=${tripletCombination[$key]}
      percentage[$key]=$((value*100/numberOfTime))
   done
}

function storeTripletCombination() {
   for((i=0; i<$numberOfTime; i++))
   do
      count=0
      result=""
		  while [ $count != 3 ]
      do
         result+=$( flipCoin )
         ((count++))
      done
      value=${tripletCombination[$result]}
      tripletCombination[$result]=$((++value))
   done
}

read -p "Enter Number Of Time:" numberOfTime
storeSingletCombination
echo ${singletCombination[@]}
echo ${!singletCombination[@]}
getSingletPercentage
echo ${percentage[@]}
echo ${!percentage[@]}
storeDoubletCombination
echo ${doubletCombination[@]}
echo ${!doubletCombination[@]}
getDoubletPercentage
echo ${percentage[@]}
echo ${!percentage[@]}
storeTripletCombination
echo ${tripletCombination[@]}
echo ${!tripletCombination[@]}
getTripletPercentage
echo ${percentage[@]}
echo ${!percentage[@]}

