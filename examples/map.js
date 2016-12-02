var blessed = require('blessed')
	, contrib = require('../')
        , screen = blessed.screen()
	, map = contrib.map({label: 'Ipmap'})

screen.append(map)
	var marker = true
	setInterval(function() {
		if (marker) {
map.addMarker({"lon" : "3.1897", "lat" : "50.6566", color: "red", char: "X" })
	}
	else {
	map.clearMarkers()
	}
	marker =! marker
	screen.render()
}, 1000)
