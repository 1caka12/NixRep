
#!/bin/bash

wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '
{
    # Check if the third field contains "[MUTED]"
    if ($3 == "[MUTED]") {
        status = "Muted - "
    } else {
        status = ""
    }
    # Format the volume as a percentage
    volume = int($2 * 100) "%"
    # Output "Muted - xx%" or "xx%"
    print status volume
}'


