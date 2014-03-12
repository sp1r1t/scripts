#!/bin/bash

function usage {
  echo "usage: ./`basename $0` <hours to sleep>"    
}

function naptime {
  echo "it's now $hour:$minute"
  echo "you can nap for $sleephours hours and $sleepminutes minutes, have a good rest"
}

# need arguments
if [ $# -lt 1 ]; then
  usage
  exit
fi

# scan for options
while getopts "ht:" opt; do
  case "$opt" in
    h)
      usage
      exit
      ;;
    t)
      time=$OPTARG
      if [ "`echo $time | sed -e '/^[0-9][0-9]:[0-9][0-9]$/d'`" != "" ]; then
        usage
        echo "the -t time format is HH:MM"
        exit
      fi
      ;;
    *) 
      exit
  esac
done


if [ $time ]; then
  # current time
  hour=`date +%H`
  minute=`date +%M`

  # wake time
  wakehour=`date -d "$time" "+%H"`
  wakeminute=`date -d "$time" "+%M"`

  wakehour=${wakehour#0}
  wakeminute=${wakeminute#0}

  # hour diff
  if [ $hour -le $wakehour ]; then
    sleephours=$(($wakehour - $hour))
  else
    sleephours=$(($wakehour + 24 - $hour))
  fi    

  # minute diff
  if [ $minute -le $wakeminute ]; then
    sleepminutes=$(($wakeminute - $minute))
  else
    sleepminutes=$(($wakeminute + 60 - $minute))
    if [ $sleephours -eq 0 ]; then
      sleephours=23
    else
      sleephours=$(($sleephours - 1))
    fi
  fi    

  sleeptime=$(($sleephours * 60 * 60 + $sleepminutes * 60))
else
  # set sleep time
  sleeptime=`echo "$1 * 60 * 60" | bc`
  
  # cut rational part
  if [ `echo $sleeptime | grep "\."` ]; then
    sleeptime=`echo $sleeptime | cut -d '.' -f1`
  fi


  # current time
  hour=`date +%H`
  minute=`date +%M`

  # convert input
  var=$1
  if [ `echo $var | grep "\."` ]; then
    varInt=`echo $var | cut -d '.' -f1`
    varRest=`echo $var | cut -d '.' -f2`
    varFirstPlace=`echo $varRest | cut -c1`
  else
    varInt=$var
    varRest=0
    varFirstPlace=0
  fi


  # calc new minutes
  if [ $varFirstPlace -eq 0 ]; then
    newminutes=0
  else
    newminutes=$((6 * $varFirstPlace))
  fi

  # set wakeup time
  wakehour=$(($hour + $varInt))
  wakeminute=$(($minute + $newminutes))

  # check hour overflow in wakeuptime
  if [ $wakehour -ge 24 ]; then
    wakehour=$(($wakehour - 24))
  fi

  # check minute overflow in wakeuptime
  if [ $wakeminute -ge 60 ]; then
    wakehour=$(($wakehour + 1))
    wakeminute=$(($wakeminute - 60))
  fi

  # set sleephours and mintues
  sleephours=$(($sleeptime / 60 / 60))
  sleepminutes=$((($sleeptime - $sleephours * 60 * 60) / 60))
fi

naptime
printf "sleeping %d seconds until %02d:%02d\n" "$sleeptime" "$wakehour" "$wakeminute"

sleep $sleeptime; mocp --play