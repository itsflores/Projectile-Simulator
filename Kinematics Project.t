%Physics Projectile Motion program by Omar Garcia 

var projectilemotion : int := Window.Open ("graphics:Max;Max") 

const g : real := -9.81
const G : real := 9.81

var font : int := Font.New ("Segoe UI Light:20")

var hdimension : int := 0
var vdimension : int := 0

hdimension := maxx
vdimension := maxy - (maxy div 6)

var timecount : real := 0
var ch : string(1)
var deltadx : real := 0
var deltady : real := 0
var velocity1 : real := 0
var anglev1 : real := 0
var velocity2 : real := 0
var anglev2 : real := 0
var mass : real := 0
var height1 : real := 0
var horizontalvel1 : real := 0
var maxh : real := 0
var verticalvel1 : real := 0
var verticalvel2 : real := 0
var totaltime : real := 0
var v2y : real := 0
var hscale : real := 0
var vscale : real := 0
var xpoint : real := 0
var ypoint : real := 0
var maxdx : real := 0
var vVelocity : real := 0

%
%///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
%

proc moveText (text : string, alignment : real, y, font, hintTextC : int)
    Font.Draw (text,
        round (alignment * (maxx - Font.Width (text, font))), y,
        font, hintTextC)
end moveText

proc horizontalV1
    horizontalvel1 := (abs(velocity1)) * (cosd(anglev1))
end horizontalV1

proc verticalV1
    verticalvel1 := (abs(velocity1)) * (sind(anglev1))
end verticalV1

proc maxheight
    maxh := ((-1) * (verticalvel1) * (verticalvel1)) / (2 * g)
end maxheight

proc deltay
    if height1 > 0 then 
        deltady := (-1) * (height1)
    else 
        deltady := 0
    end if 
end deltay

proc calctime
    if ((-1 * verticalvel1) + sqrt((verticalvel1 * verticalvel1) - (4) * (g/2) * ((-1) * deltady))) / (g) > 0 then 
        totaltime := ((-1 * verticalvel1) + sqrt((verticalvel1 * verticalvel1) - (4) * (g/2) * ((-1) * deltady))) / (g)
    else 
        totaltime := ((-1 * verticalvel1) - sqrt((verticalvel1 * verticalvel1) - (4) * (g/2) * ((-1) * deltady))) / (g)
    end if 
end calctime

proc horizontalrange
    if deltady = 0 then 
        deltadx := ((abs(velocity1)) * (abs(velocity1)) * (sind(2*anglev1))) / G
    else
        deltadx := horizontalvel1 * totaltime
    end if 
end horizontalrange

proc verticalV2
    verticalvel2 := (verticalvel1 + ((g) * (totaltime)))
end verticalV2

proc calcVel2
    velocity2 := sqrt(((horizontalvel1) * (horizontalvel1)) + ((verticalvel2) * (verticalvel2)))
    velocity2 := (-1) * (velocity2)
end calcVel2

proc maxdeltadx
    if deltady = 0 then 
        maxdx := ((abs(velocity1)) * (abs(velocity1)) * (sind(2*45))) / G
    else
        maxdx := ((abs(velocity1)) * (cosd(45))) * totaltime * totaltime
    end if 
end maxdeltadx

proc verticalscale  
    vscale := ((maxy - (maxy/6))/(maxh + height1))
end verticalscale

proc horizontalscale
    hscale := ((maxx) / (deltadx))
end horizontalscale

proc nextscreen
    loop
        getch (ch)
        exit when
        ord (ch) = 32
    end loop
end nextscreen

process plottingless45
    timecount := 0
    xpoint := 0
    ypoint := 0
    
    if height1 > 0 then 
        loop
            xpoint := ((horizontalvel1 * timecount)) * (hscale)
            ypoint := (height1 + ((verticalvel1 * timecount) + ((g / 2) * timecount * timecount))) * (vscale)
            timecount := timecount + 0.01
            drawfilloval(floor (xpoint), floor (ypoint), 1, 1, black)
            delay (10)
            exit when
            timecount > totaltime
        end loop
    elsif height1 = 0 then 
        loop
            xpoint := ((horizontalvel1 * timecount)) * (hscale)
            ypoint := (height1 + ((verticalvel1 * timecount) + ((g / 2) * timecount * timecount))) * (hscale)
            timecount := timecount + 0.01
            drawfilloval(floor (xpoint), floor (ypoint), 1, 1, black)
            delay (10)
            exit when
            timecount > totaltime
        end loop
    end if
end plottingless45

process plottingmore45
    timecount := 0
    xpoint := 0
    ypoint := 0
    
    loop
        xpoint := ((horizontalvel1 * timecount)) * (vscale)
        ypoint := (height1 + ((verticalvel1 * timecount) + ((g / 2) * timecount * timecount))) * (vscale)
        timecount := timecount + 0.01
        drawfilloval(floor (xpoint), floor (ypoint), 1, 1, black)
        delay (10)
        exit when
        timecount > totaltime
    end loop
end plottingmore45

process vVelocities
    vVelocity := 0
    loop
        vVelocity := (verticalvel1 + (g * timecount))
        delay (20)
        drawfillbox((maxx div 2) - (maxx div 25), (maxy - (maxy div 6)) + (maxy div 20), (maxx div 2) + (maxx div 25), (maxy - (maxy div 6)) + (maxy div 15), white)
        moveText (realstr(vVelocity, (maxx div maxy)), 0.5, (maxy - (maxy div 6)) + (maxy div 20), font, blue)
        exit when
        timecount > totaltime
    end loop
end vVelocities

process scaling
    for i : 1 .. 10
        Draw.ThickLine((maxx div 10) * i, 0, ((maxx div 10) * i), 10, 2, red)
    end for
    
    for i : 1 .. 10
        Draw.ThickLine(0, ((maxy - (maxy/6)) div 10) * i, 10, ((maxy - (maxy/6)) div 10) * i, 2, red)
    end for
end scaling

%
%//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
%

put "Welcome to Omar Garcia's Projectile Motion program"
put ""
put "In this program, the user will input the velocity applied on the projectile, the angle in which it is launched, the height of the launch, and the projectile's mass (comming soon)"
put ""
put "//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////"
put ""
put "Please enter the magnitude of the velocity of the object at launch in m/s: "
get velocity1
put ""
put "Please enter the angle of the velocity at launch above the horizon: "
get anglev1
put ""
put "Please enter the height of the launch point: "
get height1

horizontalV1
verticalV1
maxheight
deltay
calctime
horizontalrange
verticalV2
calcVel2

put "Press space bar to procede"

nextscreen
cls

put "The horizontal velocity at launch is equal to: ", horizontalvel1, " m/s"
put "The vertical velocity at launch is equal to: ", verticalvel1, " m/s"
put "The max heigt of the projectile is: ", maxh, " m"
put "Delta dy: ", deltady, " m"
put "The duration of the projectile's trajectory is: ", totaltime, " s"
put "The horizontal range of the projectile's trajectory is: ", deltadx, " m"
put "The second vertical velocity of the projectile is: ", verticalvel2, " m/s"
put "The total velocity of the projectile before landing is: ", velocity2, " m/s"
put ""

maxdeltadx
verticalscale
horizontalscale

put "Horizontally, ",hscale, " pixels = 1 metre" 
put "Horizontally, ",vscale, " pixels = 1 metre"  

drawbox (0, 0, hdimension, vdimension, black)

if anglev1 <= 45 then 
    fork plottingless45
    fork vVelocities
    drawbox (0,0, maxx div 42, floor (height1 * vscale), black)
    fork scaling
elsif anglev1 > 45 then
    fork plottingmore45
    fork vVelocities
    drawbox (0,0, maxx div 42, floor (height1 * vscale), black)
    fork scaling
end if

