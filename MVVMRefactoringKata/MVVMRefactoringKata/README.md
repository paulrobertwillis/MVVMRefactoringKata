-- Acceptance Criteria --

WHEN app is loaded
THEN should set background colour to yellow
and count label should be set to "Times Pressed: 0"
and press me button should be enabled

WHEN press me button is tapped
THEN should increment count value by 1
and should update count label

GIVEN count value is 9
WHEN press me button is tapped
THEN should increment count value by 1
and should update count label
and should set background colour to green
and should disable press me button 

GIVEN count value is 10
WHEN press me button is tapped 
THEN should NOT increment count value
and should NOT update count label
and should NOT set background colour


