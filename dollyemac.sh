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
    local userInput
    local pkg=macchanger

    echo -e ${ORANGE}"Checking if someone can deliver your package..."
    sleep 1

    which $pkg > /dev/null 2>&1

    if [[ $? == 0 ]]
    then
        echo -e "Dollye is available..."
    else
        echo -e "Dollye is on a delivery. Preparing request for pickup..."
        sleep 1

        read -p $'Would you like to submit a request (y/n):\e[35m ' userInput
        if [[ $userInput == "y" || $userInput == "yes" ]]
        then
            echo -e ${ORANGE}"Submitting request for package delivery..."
            sleep 2

            sudo apt update && sudo apt upgrade && sudo apt install $pkg
            echo -e ${ORANGE}"Package is ready for delivery."
        else
            sleep 0.5
            echo -e ${ORANGE}"Canceling request for pickup. good day."
        fi
    fi 

    sleep 1
    pause
}

#this will open DollyeMAC options
useDollyeMac()
{
    local appleMac
    local userAdapter

    echo -e ${ORANGE}"Checking your wirless adapter..."
    sleep 1

    echo -e                      ${GREEN}"::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::"${ORANGE}

    #the command below grabs the wireless adpater and 
    #displays it for the user. The comments below it are
    #alternative methods to create the same outcome 
    ifconfig | awk 'FNR == 17 {print $1}' | tr -d \:

    ####################################################
    ############### Alternative Methods ################
    ####################################################
    #ls /sys/class/net | awk 'FNR == 3 {print $1}'
    #ip link show | awk -F'[:]' 'FNR == 5 {print $2}'
    ####################################################
    ####################################################
    echo -e                      ${GREEN}"::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::"
    echo -e ${BLINK}${REDB}${WHITE}${BOLD}"     copy/take note of the letters/numbers above        "${NT}
    echo -e                      ${GREEN}"::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::"${NT}
    sleep 0.5

    read -p $'\e[38;5;208mInsert the wireless adapter you just copied:\e[35m ' userAdapter
    sleep 0.5
    echo -e ${ORANGE}"Go to your Apple TV Settings app. Then go to"
    echo -e "General/About/Wi-Fi Address and insert the"
    echo -e "Wi-Fi Address below..."
    sleep 1

    read -p $'\e[38;5;208mInsert the Apple TV Wi-Fi Address:\e[35m ' appleMac
    sleep 0.5
    echo -e ${ORANGE}"Shutting down the wireless interface..."
    sudo ifconfig $userAdapter down
    echo -e ${PURPLE}"Waiting for wireless adapter to accept new Wi-Fi Address..."${ORANGE}
    sleep 10

    sudo macchanger --mac=$appleMac $userAdapter
    echo -e ${PURPLE}"Waiting for wireless adapter to display wireless interface..."
    sudo ifconfig $userAdapter up
    sleep 10

    echo -e ${PURPLE}"Checking new Wi-Fi Address for this PC..."${ORANGE}
    sleep 1
    macchanger -s $userAdapter

    sleep 1
    pause
}

#this will return the MAC address to the default address
changeMacBack()
{
    local modiMac=$(eval ifconfig | awk 'FNR == 17 {print $1}' | tr -d \:)
    local userInput

    read -p $'\e[38;5;208mReady to turn in your Digital Dollye? (y/n):\e[35m ' userInput
    
    if [[ $userInput == "y" || $userInput == "yes" ]]
    then
        echo -e ${ORANGE}"Good. let's get started..."
        sleep 1
        echo -e "Checking Digital Dollye..."${PURPLE}
        sleep 1
        macchanger -s $modiMac
        sleep 1
        echo -e ${ORANGE}"Turning in Digital Dollye..."
        sleep 2
        echo -e ${ORANGE}"Checking paper work..."${PURPLE}
        sudo ifconfig $modiMac down
        sleep 10
        sudo macchanger -p $modiMac
        echo -e ${ORANGE}"checking deposit fees..."${PURPLE}
        sudo ifconfig $modiMac up

        sleep 10
        echo -e ${ORANGE}"None."
        sleep 1
        echo -e "Everything looks good. Thanks for using the Digital Dollye."
    else
        echo -e "You can't keep it for ever silly. It will find its way back"
        echo -e "home after you reboot your system. Once the Digital Dollye"
        echo -e "has left your PC, then your Wi-Fi Address will return to"
        echo -e "normal. Good day."
    fi

    sleep 1
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

    echo -e ${GREEN}"::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::"
    echo -e ${GREEN}"::-::-::-::- ${WHITE}${BOLD}Welcome to the ${PURPLE}Dollye${ORANGE}MAC ${WHITE}Lobby ${NT}${GREEN}-::-::-::-::"${NT}
    echo -e ${GREEN}"::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::"${NT}    
    echo -e ${GREEN}":${PURPLE}1${GREEN}-:: ${ORANGE}Check That DollyeMAC Works${GREEN} ::-::-::-::-::"
    echo -e ${GREEN}":${PURPLE}2${GREEN}-:: ${ORANGE}Use The Digital Dollye    ${GREEN} ::-::-::-::-::"
    echo -e ${GREEN}":${PURPLE}3${GREEN}-:: ${ORANGE}Return The Digital Dollye ${GREEN} ::-::-::-::-::_________"
    echo -e ${GREEN}":${PURPLE}0${GREEN}-:: ${ORANGE}Exit the lobby            ${GREEN} ::-::-::-::-::${UL}  v1.0   ${NT}"
}

#this will read user input
readOptions()
{
  local userChoice
  read -p $'\e[38;5;208mChoose an option from the lobby:\e[35m ' userChoice

  case $userChoice in
    1) checkForDependency ;;
    2) useDollyeMac ;;
    3) changeMacBack ;;
    0) exit 0 ;;
    *) echo -e ${BLINK}${REDB}${WHITE}"WARNING${NT}${PURPLE}...You are trying to use the wrong Dollye.\n${ORANGE}You will now be escorted by security back to the lobby"${NT} && sleep 6 ;;
  esac
}

while true
do
    DollyeMacMenu
    readOptions
done