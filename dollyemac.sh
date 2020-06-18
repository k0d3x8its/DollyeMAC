#!/bin/bash

# This shell script is meant to provide access to hotel Wi-Fi 
# when the interstitial page is displayed which will require 
# a browser that most streaming devices do not possess

#colors
BOX='\e[38;5;229m'        #box
SILVER='\e[38;5;247m'     #silver
RED='\e[38;5;196m'        #red
ORANGE='\e[38;5;208m'     #orange
YELLOW='\e[38;5;11m'      #yellow
SHADBOX='\e[38;5;221m'    #box shade
DARKBOX='\e[38;5;222m'    #box dark
WHITE='\e[38;5;15m'       #white
PURPLE='\e[35m'           #purple
LITEPURPLE='\e[95m'       #light purple
TIRE='\e[38;5;238m'       #tires
GRAVEL='\e[38;5;254m'     #gravel
GREYGREEN='\e[38;5;151m'  #greyish green
LITEGREEN='\e[38;5;118m'  #light green
GREEN='\e[38;5;112m'      #green

#Background colors
REDB='\e[41m'             #red

#text manipulation
NT='\e[0m'                #normal text
BOLD='\e[1m'              #bold text
UL='\e[4m'                #underlined text
BLINK='\e[5m'             #blink text

#################
### functions ###
#################

#this will return the user to the menu
pause()
{
    read -p $'\e[35mPress [Enter] to return to the lobby...\e[0m'
}

#this will check for macchanger and if not installed then DollyeMAC will install it
checkForDependency()
{
    local pkg=macchanger

    echo -e "Checking if someone can deliver your package..."
    sleep 1

    which $pkg > /dev/null 2>&1

    if [[ $? == 0 ]]
    then
        echo -e "Dollye is available..."
    else
        echo -e "Dollye is on a delivery. Preparing request for pickup..."
        sleep 1
        read -p "Would you like to submit a request (y/n): " input
        if [[ $input == "y" || $input == "yes" ]]
        then
            echo -e "Submitting request for package delivery..."
            sleep 1
            sudo apt update && sudo apt upgrade && sudo apt install $pkg
            echo -e ${ORANGE}"Package is ready for delivery."
        else
            sleep 0.5
            echo -e "Canceling request for pickup as ordered. good day."
        fi
    fi 
    pause
}

#this will open DollyeMAC options
useDollyeMac()
{
    pause
}

#this will display the choices in a menu format
DollyeMacMenu()
{
    clear

    #
    echo -e ${RED}"   ##%%       #%%"                                  
    echo -e ${SILVER}"     |&(        %%${SHADBOX}/${BOX}***********"                     
    echo -e ${SILVER}"      %%\      ${SHADBOX}/////${BOX}***********"                   
    echo -e ${SILVER}"       & \&&%${SHADBOX}////////${BOX}***********"                   
    echo -e ${SILVER}"        %  #${SHADBOX}(/////////${BOX}*************"                  
    echo -e ${SILVER}"         &  #${SHADBOX}(/////////${BOX}*${PURPLE}++++${ORANGE}${BOLD}MAC${NT}${PURPLE}+++${BOX}**"               
    echo -e ${SILVER}"          & #${SHADBOX}(//////////${BOX}*************"               
    echo -e ${SILVER}"           [ #&${SHADBOX}//////////${BOX}*************"             
    echo -e ${SILVER}"           % %${SHADBOX}(///////////${BOX}*${PURPLE}++${ORANGE}${BOLD}ADDRESS${NT}${PURPLE}++${BOX}**"            
    echo -e ${SILVER}"             % #${SHADBOX}(//////////${BOX}**************"           
    echo -e ${SILVER}"              ( #${SHADBOX}(//////////${BOX}**************"          
    echo -e ${SILVER}"               # #${SHADBOX}(//////////${BOX}**************"          
    echo -e ${SILVER}"                & &#${SHADBOX}(/////////${BOX}**************"         
    echo -e ${SILVER}"               , &&${SHADBOX}((//////////${DARKBOX}***${SILVER}//${DARKBOX}**${SILVER}//${DARKBOX}***"        
    echo -e ${SILVER}"                & %%${SHADBOX}((////////${DARKBOX}###${SILVER}//${DARKBOX}##${SILVER}//${DARKBOX}###"
    echo -e ${SILVER}"                 \ %^${SHADBOX}(///////${DARKBOX}###${SILVER}//${DARKBOX}##${SILVER}//${DARKBOX}##"               
    echo -e ${TIRE}"            %#%&@@ ${SILVER}@&&&&%&&${TIRE}(*&&&@@"                  
    echo -e ${TIRE}"           %.&*%&@@   &%%%   .&@@@"                  
    echo -e ${TIRE}"           %&.  %@@@..,%:*/&%%@@@"                   
    echo -e ${GRAVEL}"        ...,${TIRE}&%%%@@@${GRAVEL}//////////**,,..."                
    echo -e ${GRAVEL}"           .....,,,,,,*******,,,,,....."            
                                                              
    echo -e ${GRAVEL}"@@@@@@@    @@@@@@   @@@       @@@       @@@ @@@  @@@@@@@@"
    echo -e ${GRAVEL}"@@@@@@@@  @@@@@@@@  @@@       @@@       @@@ @@@  @@@@@@@@"
    echo -e ${GRAVEL}"@@${GREYGREEN}!  ${GRAVEL}@@@  @@${GREYGREEN}!  ${GRAVEL}@@@  @@${GREYGREEN}!       ${GRAVEL}@@${GREYGREEN}!       ${GRAVEL}@@${GREYGREEN}! !${GRAVEL}@@  @@${GREYGREEN}!"      
    echo -e ${GREYGREEN}"!${GRAVEL}@${GREYGREEN}!  ${GRAVEL}@${GREYGREEN}!${GRAVEL}@  ${GREYGREEN}!${GRAVEL}@${GREYGREEN}!  ${GRAVEL}@${GREYGREEN}!${GRAVEL}@  ${GREYGREEN}!${GRAVEL}@${GREYGREEN}!       !${GRAVEL}@${GREYGREEN}!       !${GRAVEL}@${GREYGREEN}! ${GRAVEL}@${GREYGREEN}!!  !${GRAVEL}@${GREYGREEN}!"       
    echo -e ${GRAVEL}"@${GREYGREEN}!${GRAVEL}@  ${GREYGREEN}!${GRAVEL}@${GREYGREEN}!  ${GRAVEL}@${GREYGREEN}!${GRAVEL}@  ${GREYGREEN}!${GRAVEL}@${GREYGREEN}!  ${GRAVEL}@${GREYGREEN}!!       ${GRAVEL}@${GREYGREEN}!!        ${GREYGREEN}!${GRAVEL}@${GREYGREEN}!${GRAVEL}@${GREYGREEN}!   ${GRAVEL}@${GREYGREEN}!!!${GREEN}:${GREYGREEN}!"   
    echo -e ${GREYGREEN}"!${GRAVEL}@${GREYGREEN}!  !!!  !${GRAVEL}@${GREYGREEN}!  !!!  !!!       !!!         ${GRAVEL}@${GREYGREEN}!!!   ${GREYGREEN}!!!!!${GREEN}:"    
    echo -e ${GREYGREEN}"!!${GREEN}:  ${GREYGREEN}!!!  !!${GREEN}:  ${GREYGREEN}!!!  !!${GREEN}:       ${GREYGREEN}!!${GREEN}:         ${GREYGREEN}!!${GREEN}:    ${GREYGREEN}!!${GREEN}:"      
    echo -e ${GREEN}":${GREYGREEN}!${GREEN}:  ${GREYGREEN}!${GREEN}:${GREYGREEN}!  ${GREEN}:${GREYGREEN}!${GREEN}:  ${GREYGREEN}!${GREEN}:${GREYGREEN}!  ${GREEN}:${GREYGREEN}!${GREEN}:       :${GREYGREEN}!${GREEN}:         :${GREYGREEN}!${GREEN}:    :${GREYGREEN}!${GREEN}:"       
    echo -e ${GREEN}" :::: ::  ::::: ::   :: ::::   :: ::::     ::     :: ::::"  
    echo -e ${GREEN}":: :  :    : :  :   : :: : :  : :: : :     :     : :: ::"

    echo -e ${GRAVEL}"             @@@@@@@@@@    @@@@@@    @@@@@@@"
    echo -e ${GRAVEL}"             @@@@@@@@@@@  @@@@@@@@  @@@@@@@@"
    echo -e ${GRAVEL}"             @@${GREYGREEN}! ${GRAVEL}@@${GREYGREEN}! ${GRAVEL}@@${GREYGREEN}!  ${GRAVEL}@@${GREYGREEN}!  ${GRAVEL}@@@  ${GREYGREEN}!${GRAVEL}@@"
    echo -e ${GREYGREEN}"             !${GRAVEL}@${GREYGREEN}! !${GRAVEL}@${GREYGREEN}! !${GRAVEL}@${GREYGREEN}!  !${GRAVEL}@${GREYGREEN}!  ${GRAVEL}@${GREYGREEN}!${GRAVEL}@  ${GREYGREEN}!${GRAVEL}@${GREYGREEN}!"
    echo -e ${GRAVEL}"             @${GREYGREEN}!! !!${GRAVEL}@ @${GREYGREEN}!${GRAVEL}@  @${GREYGREEN}!${GRAVEL}@${GREYGREEN}!${GRAVEL}@${GREYGREEN}!${GRAVEL}@${GREYGREEN}!  !${GRAVEL}@${GREYGREEN}!"
    echo -e ${GREYGREEN}"             !${GRAVEL}@${GREYGREEN}!  !  !${GRAVEL}@${GREYGREEN}!  !!!${GRAVEL}@${GREYGREEN}!!!!  !!!"
    echo -e ${GREYGREEN}"             !!${GREEN}:     ${GREYGREEN}!!${GREEN}:  ${GREYGREEN}!!${GREEN}:  ${GREYGREEN}!!!  ${GREEN}:${GREYGREEN}!!"
    echo -e ${GREEN}"             :${GREYGREEN}!${GREEN}:     :${GREYGREEN}!${GREEN}:  :${GREYGREEN}!${GREEN}:  ${GREYGREEN}!${GREEN}:${GREYGREEN}!  ${GREEN}:${GREYGREEN}!${GREEN}:"
    echo -e ${GREEN}"             :::     ::   ::   :::   ::: :::"
    echo -e "              :      :     :   : :   :: :: :"${NT}

    echo -e ${GREEN}"::-::-::- ${NT}Welcome to the ${PURPLE}Dollye${ORANGE}MAC ${WHITE}Lobby ${GREEN}-::-::-::"${NT}
    echo -e "1) Check That DollyeMAC Works"
    echo -e "2) Use The Digital Dollye"
    echo -e "0) Exit the lobby"
}

#this will read user input
readOptions()
{
  local userChoice
  read -p $'\e[38;5;208mChoose an option from the lobby ' userChoice

  case $userChoice in
    1) checkForDependency ;;
    2) useDollyeMac ;;
    0) exit 0 ;;
    *) echo -e ${BLINK}${REDB}${WHITE}"WARNING${NT}${PURPLE}...You are trying to use the wrong Dollye. ${ORANGE}You will now be escorted by security back to the lobby"${NT} && sleep 6 ;;
  esac
}

while true
do
    DollyeMacMenu
    readOptions
done