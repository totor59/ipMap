#!/bin/bash

####################################################
#  _      ___  ___                     __   _____  #
# (_)     |  \/  |                    /  | |  _  | #
#  _ _ __ | .  . | __ _ _ __   __   __`| | | |/' | #
# | | '_ \| |\/| |/ _` | '_ \  \ \ / / | | |  /| | #
# | | |_) | |  | | (_| | |_) |  \ V / _| |_\ |_/ / #
# |_| .__/\_|  |_/\__,_| .__/    \_/  \___(_)___/  #
#   | |                | |                         #
#   |_|                |_|                         #
#                                                  #
####################################################
##### by totor59 ~~ https://github.com/totor59 #####
####################################################


# On récupère l'IP publique
publicip="$(wget -q -O - http://icanhazip.com/ | tail)"

# On récupère les coordonnées GPS correspondant a l'IP récupérée
	# On récupère la longitude
lon="$(curl ipinfo.io/87.231.6.105 | grep "loc" | cut -d, -f2 | awk '{ print $1}')"
	# On récupère lattitude
lat="$(curl ipinfo.io/87.231.6.105 | grep "loc" | cut -d, -f1 | awk '{ print $2}')"

# On supprime les 3 dernieres et on ajoute les 3 lignes contenant les nouvelles variables
sed -i '10,17 d' examples/map.js
echo -e "map.addMarker({\"lon\" : \""${lon}", \"lat\" : "${lat}"\", color: \"red\", char: \"X\" })\n\t}\n\telse {\n\tmap.clearMarkers()\n\t}\n\tmarker =! marker\n\tscreen.render()\n}, 1000)" >> examples/map.js

# On print la carte dans le terminal
nodejs examples/map.js


