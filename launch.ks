//hellolaunch

//First, we'll clear the terminal screen to make it look nice
CLEARSCREEN.

//Next, we'll lock our throttle to 100%.
LOCK THROTTLE TO 1.0.   // 1.0 is the max, 0.0 is idle.

//This is our countdown loop, which cycles from 10 to 0
PRINT "Counting down:".
FROM {local countdown is 10.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown.
    WAIT 1. // pauses the script here for 1 second.
}
//This will be our main control loop for the ascent. It will
//cycle through continuously until our apoapsis is greater
//than 100km. Each cycle, it will check each of the IF
//statements inside and perform them if their conditions
//are met
SET MYSTEER TO HEADING(90,90).
LOCK STEERING TO MYSTEER. // from now on we'll be able to change steering by just assigning a new value to MYSTEER
UNTIL SHIP:VELOCITY:SURFACE:MAG > 2000 { //Remember, all altitudes will be in meters, not kilometers

    //For the initial ascent, we want our steering to be straight
    //up and rolled due east
    IF SHIP:VELOCITY:SURFACE:MAG < 100 {
        //This sets our steering 90 degrees up and yawed to the compass
        //heading of 90 degrees (east)
        SET MYSTEER TO HEADING(90,90).

    //Once we pass 100m/s, we want to pitch down ten degrees
    } ELSE IF SHIP:VELOCITY:SURFACE:MAG <300 {
        SET MYSTEER TO HEADING(90,45).
        PRINT "Pitching to 45 degrees" AT(0,15).
        PRINT ROUND(SHIP:VELOCITY:SURFACE:MAG,0) AT (0,16).
    } else if SHIP:VELOCITY:SURFACE:MAG <500 {
        SET MYSTEER TO HEADING(90,25).
        PRINT "Pitching to 25 degrees" AT(0,15).
        PRINT ROUND(SHIP:VELOCITY:SURFACE:MAG,0) AT (0,16).

    } else if SHIP:VELOCITY:SURFACE:MAG <700 {
        SET MYSTEER TO HEADING(90,15).
        PRINT "Pitching to 15 degrees" AT(0,15).
        PRINT ROUND(SHIP:VELOCITY:SURFACE:MAG,0) AT (0,16).
    } else if SHIP:VELOCITY:SURFACE:MAG <1400 {
        SET MYSTEER TO HEADING(90,5).
        PRINT "Pitching to 10 degrees" AT(0,15).
        PRINT ROUND(SHIP:VELOCITY:SURFACE:MAG,0) AT (0,16).
    } else if SHIP:VELOCITY:SURFACE:MAG >=1400 {
        SET MYSTEER TO HEADING(90,25).
        PRINT "Pitching to 25 degrees" AT(0,15).
        PRINT ROUND(SHIP:VELOCITY:SURFACE:MAG,0) AT (0,16).
    } 
}.