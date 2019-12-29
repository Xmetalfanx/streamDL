# https://windowsloop.com/download-m3u8-video-with-ffmpeg/

function downloadStream()
{
    # Does the actual downloading
    ffmpeg -i "$streamURL" -c copy -bsf:a aac_adtstoasc "$outputFileName.mp4"
}

# Copied from other repo ... more to help pause the screen, for debugging
function userPrompt()
{
  read -p "Press [Enter] to continue "
}

# Main function
function main()
{
    clear
    echo -e "This will (hopefully) Download streaming media into a mp4 file"
    read -p "Stream URL: " streamURL

    read -p "Is this a TV program?(y/n)" tvAnswer
    case $tvAnswer in  
        [Yy])  
            read -p "Show Name: " showName
            read -p "Season: " seasonNum
            read -p "Episode Number: " episodeNum

            outputFileName="${showName}S${seasonNum}Ep${episodeNum}"

            echo $outputFileName
            userPrompt

        ;; 

        [Nn]) 
            read -p "Output file Name (no ext):" outputFileName

        ;; 


    esac 

     downloadStream $streamURL $outputFileName
}

main
