#!/bin/bash
# Build type chooser for the Gnosis ROM
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

echo -e ${grn}""
echo -e "                      AAAAAAAAAAAAAAA       HHHHHHH     HHHHHHH       ";
echo -e "                     A:::::::::::::::A      H:::::H     H:::::H       ";
echo -e "                    A::::::AAAAA::::::A     H:::::H     H:::::H       ";
echo -e "                    A:::::A     A:::::A     H:::::H     H:::::H       ";
echo -e "                    A:::::A     A:::::A     H:::::HHHHHHH:::::H       ";
echo -e "                    A:::::AAAAAAA:::::A     H:::::::::::::::::H       ";
echo -e "                    A:::::::::::::::::A"${txtrst}"  ∴"${grn}"  H:::::::::::::::::H       ";
echo -e "                    A:::::AAAAAAA:::::A     H:::::HHHHHHH:::::H       ";
echo -e "                    A:::::A     A:::::A     H:::::H     H:::::H       ";
echo -e "                    A:::::A     A:::::A     H:::::H     H:::::H       ";
echo -e "                    A:::::A     A:::::A     H:::::H     H:::::H       ";
echo -e "                    AAAAAAA     AAAAAAA     HHHHHHH     HHHHHHH       ";
echo -e ${txtrst}"                            AEON                   HOROS              ";
echo -e ${ylw}"\n ▼ Which build-type do you want to choose? \n"${txtrst}
echo -e ${txtrst}"   〉 "${grn}"0"${txtrst}"- "${grn}"Gnosis       "${txtrst}" ︱ "${grn}"For Gnosis builds"${txtrst}
echo -e "";
echo -e ${blu}"   〉 1- Unofficial "${txtrst}${red}"   ︱ For the unofficial builds"${txtrst}
echo -e "";
echo -e ${blu}"   〉 2- Nightly "${txtrst}${red}"      ︱ Only for the official daily builds by the maintainers"${txtrst}
echo -e "";
echo -e ${blu}"   〉 3- Weekly "${txtrst}${red}"       ︱ Only for the official weekly builds by the maintainers"${txtrst}
echo -e "";
echo -e ${blu}"   〉 4- Official "${txtrst}${red}"     ︱ Only for the official builds by the maintainers"${txtrst}
echo -e "";
echo -e ${blu}"   〉 30/sec Time-out"${txtrst}${red}"  ︱ Default option"${txtrst}
echo -e "";
echo -e ${red}" ▼ Choose a number"${txtrst}
$normal
read -t 30 askvariant
sleep 1
if [ "$askvariant" == "0" ]
then
echo -e "";
echo -e ${grn}"   ▪ Building Gnosis "${txtrst}
export ROM_BUILD_TYPE=GNOSIS
echo -e "";
echo -e "";
$normal
sleep 1
fi
if [ "$askvariant" == "1" ]
then
echo -e "";
echo -e ${blu}"   ▪ Building unofficial variant "${txtrst}
export ROM_BUILD_TYPE=UNOFFICIAL
echo -e "";
echo -e "";
$normal
sleep 1
fi
if [ "$askvariant" == "2" ]
then
echo -e "";
echo -e ${blu}"   ▪ Building nightly variant "${txtrst}
export ROM_BUILD_TYPE=NIGHTLY
echo -e "";
echo -e "";
$normal
sleep 1
fi
if [ "$askvariant" == "3" ]
then
echo -e "";
echo -e ${blu}"   ▪ Building weekly variant "${txtrst}
export ROM_BUILD_TYPE=WEEKLY
echo -e "";
echo -e "";
$normal
sleep 1
fi
if [ "$askvariant" == "4" ]
then
echo -e "";
echo -e ${blu}"   ▪ Building weekly variant "${txtrst}
export ROM_BUILD_TYPE=OFFICIAL
echo -e "";
echo -e "";
$normal
sleep 1
fi

./vendor/gnosis/tools/changelog.sh
