#!/bin/bash
# Simple sh to automatic generate a file with source and device specif git commit changes to use in a github wiki pages or file.md
# like this:
# https://github.com/bhb27/android_vendor_crdroid/blob/change_temp/Changelog.md
# file.md can work with more data or have more lines then a page wiki
# input variables set the below the rest must be automatic
# Specify colors utilized in the terminal
    red=$(tput setaf 1)             #  red
    grn=$(tput setaf 2)             #  green
    ylw=$(tput setaf 3)             #  yellow
    blu=$(tput setaf 4)             #  blue
    ppl=$(tput setaf 5)             #  purple
    cya=$(tput setaf 6)             #  cyan
    txtbld=$(tput bold)             #  Bold
    bldred=${txtbld}$(tput setaf 1) #  red
    bldgrn=${txtbld}$(tput setaf 2) #  green
    bldylw=${txtbld}$(tput setaf 3) #  yellow
    bldblu=${txtbld}$(tput setaf 4) #  blue
    bldppl=${txtbld}$(tput setaf 5) #  purple
    bldcya=${txtbld}$(tput setaf 6) #  cyan
    txtrst=$(tput sgr0)             #  Reset
    rev=$(tput rev)                 #  Reverse color
    pplrev=${rev}$(tput setaf 5)
    cyarev=${rev}$(tput setaf 6)
    ylwrev=${rev}$(tput setaf 3)
    blurev=${rev}$(tput setaf 4)
    normal='tput sgr0'

source_tree="./vendor/gnosis/prebuilt/common/etc"; #path here must be inside home directory
changelog_path_name=Changelog.txt #changelog file path/name.extension
source_name="AOSPie" #Name to display in changelog.md top before version
# input variables end

export ChangelogOut=./vendor/gnosis/prebuilt/common/etc/Changelog.txt

if [ -f $ChangelogOut ]; then
 	rm -f $ChangelogOut
fi


export Changelog=./Changelog.txt
export Temp_Changelog=./Changelog.txt.temp
if [ -f $Changelog ];
 then
 	rm -f $Changelog
fi
 
touch $Changelog

if [ -z $days_to_log ];then
# ask for days and version if not already specified
echo ""
echo ${ylw}" ▼ For how many days changelog do you want to generate?"${txtrst}
echo ""
echo -e ${blu}"   〉 30/sec Time-out"${txtrst}${red}" ︱ 7 Days by default"${txtrst}
echo -e "";
echo -e ${red}" ▼ Choose a number"${txtrst}
echo -e "";
# use 'export days_to_log=5' before '. build/envsetup.sh' were 5 is days to log
read -r -t 30 days_to_log || days_to_log=7
fi
echo >> $Changelog;
echo "$MOD_VERSION Changelog"    >> $Changelog;
echo '' >> $Changelog;
echo "See vendor/gnosis/prebuilts/common/etc/Changelog.txt for a list of changes." >> $Changelog;

cd $source_tree

for i in $(seq $days_to_log);
do
export After_Date=`date --date="$i days ago" +%m-%d-%Y`
k=$(expr $i - 1)
    export Until_Date=`date --date="$k days ago" +%m-%d-%Y`
    echo ""
	echo ${blu}"   〉 Generating day number $i ▪ $Until_Date.."${txtrst}
	source=$(repo forall -pc 'git log --oneline --after=$After_Date --until=$Until_Date');

    # Line with after --- until was too long for a small ListView
    echo '====================' >> $Changelog;
    echo  "     "$Until_Date       >> $Changelog;
    echo '===================='	>> $Changelog;
    echo >> $Changelog;

    # Cycle through every repo to find commits between 2 dates
    repo forall -pc 'git log --oneline --after=$After_Date --until=$Until_Date' | grep -v "Automatic translation import" >> $Changelog
    echo >> $Changelog;
done

sed -i 's/project/   */g' $Changelog

Changelog=$source_tree/$changelog_path_name
if [ -f $Changelog ] && [ -f $Temp_Changelog ];
then
	echo "$(cat $Temp_Changelog)\n$(cat $Changelog)" > $Changelog
	rm -f $Temp_Changelog
fi

echo -e ${grn}"\n √" ${ylw}"Changelog successfully generated.\n"${txtrst}
