#!/bin/bash

#BUILDS
BUILDS=(
	"grunt"
	"symfony"
)

#GLOBAL VARIABLES
CR=`echo -e $'\n\b'`
CR=${CR%.}
GREEN='\033[1;32m'
BLUE='\033[1;34m'
NC='\033[0m'

function DO_BUILD {
	if [[ "$BUILDS_ANSWER" = "grunt" ]] ; then
		
		docker build -t custom/grunt --rm share/docker/grunt
		# docker build --no-cache -t custom/grunt --rm share/docker/grunt

	else
		echo -e "$CR ${BLUE}'$BUILDS_ANSWER' NOT IMPLEMENTED ${NC} $CR  "
	fi
}


if [ "$1" != "" ]; then

    BUILDS_ANSWER=$1
    DO_BUILD

else
	echo -e "$CR ${GREEN} ----- Interactive mode ${NC} $CR  "

	function ASK_BUILD {
		local BUILDS_QUESTION="What do you want to build?"
		for i in "${!BUILDS[@]}" ; do
			BUILDS_QUESTION+="$CR   [$i]   ${BUILDS[i]}"
		done

		BUILDS_QUESTION+="$CR  $CR >> "

		while true ; do
			read -p "$BUILDS_QUESTION" BUILDS_INPUT

			local BUILD_NUMBER="$BUILDS_INPUT"
			local REGEX_IS_NUMBER='^[0-9]+$'
			if [[ $BUILD_NUMBER =~ $REGEX_IS_NUMBER ]] ; then
				local BUILD=${BUILDS[BUILD_NUMBER]}
				if [ "$BUILD" = "" ] ; then
					echo "$CR Please answer with a valid number $CR "
				else
					BUILDS_ANSWER=$BUILD
					break
				fi
			else
				echo "$CR Please answer with a valid number $CR  "
			fi

		done

		echo -e "$CR ${BLUE}You answered '$BUILDS_ANSWER' ${NC} $CR  "
	}

	echo

	ASK_BUILD
	DO_BUILD

fi

exit 0