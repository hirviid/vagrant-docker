#!/bin/bash

#RUNS
RUNS=(
	"grunt"
	"symfony"
)

#GLOBAL VARIABLES
CR=`echo -e $'\n\b'`
CR=${CR%.}
GREEN='\033[1;32m'
BLUE='\033[1;34m'
NC='\033[0m'

function DO_RUN {
	if [[ "$RUNS_ANSWER" = "grunt" ]] ; then
		
		docker run --name $ROOT_ANSWER -p 9000:9000 -p 35729:35729 -v /home/core/share/www/$ROOT_ANSWER/:/var/www -d custom/grunt

	else
		echo -e "$CR ${BLUE}'$RUNS_ANSWER' NOT IMPLEMENTED ${NC} $CR  "
	fi
}

if [ "$1" != "" ] && [ "$2" != "" ]; then

    RUNS_ANSWER=$1
    ROOT_ANSWER=$2
    DO_RUN

else
	echo -e "$CR ${GREEN} ----- Interactive mode ${NC} $CR  "

	function ASK_RUN {
		local RUNS_QUESTION="What do you want to run?"
		for i in "${!RUNS[@]}" ; do
			RUNS_QUESTION+="$CR   [$i]   ${RUNS[i]}"
		done

		RUNS_QUESTION+="$CR  $CR >> "

		while true ; do
			read -p "$RUNS_QUESTION" RUNS_INPUT

			local RUN_NUMBER="$RUNS_INPUT"
			local REGEX_IS_NUMBER='^[0-9]+$'
			if [[ $RUN_NUMBER =~ $REGEX_IS_NUMBER ]] ; then
				local RUN=${RUNS[RUN_NUMBER]}
				if [ "$RUN" = "" ] ; then
					echo "$CR Please answer with a valid number $CR "
				else
					RUNS_ANSWER=$RUN
					break
				fi
			else
				echo "$CR Please answer with a valid number $CR  "
			fi

		done

		echo -e "$CR ${BLUE}You answered '$RUNS_ANSWER' ${NC} $CR  "
	}

	function ASK_ROOT {
		local ROOT_QUESTION="Which project do you want to run?"

		ROOT_QUESTION+="$CR  $CR >> "

		read -p "$ROOT_QUESTION" ROOT_INPUT

		ROOT_ANSWER=$ROOT_INPUT

		echo -e "$CR ${BLUE}Selected project root /home/core/share/www/'$ROOT_ANSWER' ${NC} $CR  "
	}

	echo 

	ASK_RUN
	ASK_ROOT
	DO_RUN
fi

exit 0