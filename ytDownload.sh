#!/bin/bash

# AUDIO
audio="140"

# VIDEO

# 298 mp4        1280x720
# 720
HDVideo="298"


#137---mp4  ---1920x1080  1080p 3047k , avc1.640028, 30fps, video only
# 1080p
FHDVideo1="137"

#299 --- mp4  ---1920x1080  1080p60 3255k , avc1.64002a, 60fps, video only,
# 1080p
# 60 FPS 
FHDVideo2="299"

# 720pDownload
function hdDownload()
{
    echo -e "Downloading at 720p"
    youtube-dl -f $HDVideo+$audio "$ytLink"

}

# 1080p Download
function fhdDownload1()
{
    echo -e "Downloading at 1080p - Type 1"
    youtube-dl -f $FHDVideo1+$audio "$ytLink"

}

# Alternative 1080p
# 60 FPS 
function fhdDownload2()
{
    echo -e "Downloading at 1080p - Type 2"
    youtube-dl -f $FHDVideo2+$audio "$ytLink"

}


function mainMenu() {

        clear
        echo -e "${bold}${underline}Xmetal's Youtube-dl script${completeReset} \n"

        read -p "Youtube URL: " ytLink

        echo
        echo -e "1. \t 720p Video Download"
        echo -e "2. \t 1080p Video Download 1"
        echo -e "3. \t 1080p Video Download 2 (60FPS Video)"

        echo -e "4. \t Audio only"

        read -p "Download choice: " dlChoose


        case $dlChoose in

            1) hdDownload ;;
            2) fhdDownload1 ;;
            3) fhdDownload2 ;;

            4) return ;;

        esac
    done

}

mainMenu