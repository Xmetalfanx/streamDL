#!/bin/bash

# KEEP GLOBAL - AUDIO
audio="140"

# New idea for meta function
function ytDownloadMeta() {
    
    case video in
        298) echo -e "Downloading at 720p" ;;
        137) echo -e "Downloading at 1080p - Type 1" ;;
        299) echo -e "Downloading at 1080p - Type 2" ;;
    esac

    yt-dlp -f $video+$audio "$ytLink"

}

function mainMenu() {

    x=1

    while [ $x=1 ]; do

        clear
        echo -e "${bold}${underline}Xmetal's Youtube-dl script${completeReset} \n"

        read -p "Youtube URL: " ytLink
        
        echo -e "1. \t 720p Video Download"
        echo -e "2. \t 1080p Video Download 1"
        echo -e "3. \t 1080p Video Download 2 (60FPS Video)"

        echo -e "4. \t Audio only"

        read -p "Download choice: " dlChoose


        case $dlChoose in

            1)
                video="298" && ytDownloadMeta
                x=0
                ;;

            2)
                # 137---mp4  ---1920x1080  1080p 3047k , avc1.640028, 30fps, video only
                # 1080p
                video="137" && ytDownloadMeta
                x=0
                ;;

            3)
                # 299 --- mp4  ---1920x1080  1080p60 3255k , avc1.64002a, 60fps, video only,
                # 1080p
                # 60 FPS
                video="299" && ytDownloadMeta
                x=0
                ;;

            4)  yt-dlp -x "$ytLink"
                x=0
                ;;

            *)
                echo -e "Invalid selection"
                x=1
                ;;

        esac
    done

}

mainMenu