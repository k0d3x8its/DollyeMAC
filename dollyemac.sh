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

#text manipulation
NT='\e[0m'                #normal text
BOLD='\e[1m'              #bold text
UL='\e[4m'                #underlined text
BLINK='\e[5m'             #blink text

clear
 echo -e ${RED}"   ##%%       #%%"                                  
 echo -e ${SILVER}"     |&(        %%${SHADBOX}/${BOX}***********"                     
 echo -e ${SILVER}"      %%\      ${SHADBOX}/////${BOX}***********"                   
 echo -e ${SILVER}"       & \&&%${SHADBOX}////////${BOX}***********"                   
 echo -e ${SILVER}"        %  #${SHADBOX}(/////////${BOX}*************"                  
 echo -e ${SILVER}"         &  #${SHADBOX}(/////////${BOX}*${PURPLE}++++${GREEN}${BOLD}MAC${NT}${PURPLE}+++${BOX}**"               
 echo -e ${SILVER}"          & #${SHADBOX}(//////////${BOX}*************"               
 echo -e ${SILVER}"           [ #&${SHADBOX}//////////${BOX}*************"             
 echo -e ${SILVER}"           % %${SHADBOX}(///////////${BOX}*${PURPLE}++${GREEN}${BOLD}ADDRESS${NT}${PURPLE}++${BOX}**"            
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