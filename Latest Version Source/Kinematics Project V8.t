%Physics Projectile Motion program by Omar Garcia 

var projectilemotion : int := Window.Open ("graphics:Max;Max") 

const g : real := -9.81
const G : real := 9.81

var font : int := Font.New ("Segoe UI Light:20")
var font2 : int := Font.New ("Segoe UI Light:30")

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
var select : int := 0

var projectile1 : int := Pic.FileNew ("projectile1.bmp")
var projectile2 : int := Pic.FileNew ("projectile2.bmp")
var projectile3 : int := Pic.FileNew ("projectile3.bmp")
var projectile4 : int := Pic.FileNew ("projectile4.bmp")
var projectile5 : int := Pic.FileNew ("projectile5.bmp")
var projectile6 : int := Pic.FileNew ("projectile6.bmp")
var projectile7 : int := Pic.FileNew ("projectile7.bmp")
var projectile8 : int := Pic.FileNew ("projectile8.bmp")
var projectile9 : int := Pic.FileNew ("projectile9.bmp")
var projectile10 : int := Pic.FileNew ("projectile10.bmp")

var Projectile : int := 0

var vmark : int := Pic.FileNew ("verticalm.bmp")
var Vmark : int := Sprite.New (vmark)
Sprite.Hide(Vmark)

var hmark : int := Pic.FileNew ("horizontalm.bmp")
var Hmark : int := Sprite.New (hmark)
Sprite.Hide(Hmark)

%///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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

proc showProjectiles
    var xitem : int := maxx div 5
    var yitem : int := maxy div 3
    
    Pic.ScreenLoad("projectile1.bmp", maxx div 6, 2 * (maxy div 3), picMerge)
    Pic.ScreenLoad("projectile2.bmp", 2 * (maxx div 6), 2 * (maxy div 3), picMerge)
    Pic.ScreenLoad("projectile3.bmp", 3 * (maxx div 6), 2 * (maxy div 3), picMerge)
    Pic.ScreenLoad("projectile4.bmp", 4 * (maxx div 6), 2 * (maxy div 3), picMerge)
    Pic.ScreenLoad("projectile5.bmp", 5 * (maxx div 6), 2 * (maxy div 3), picMerge)
    Pic.ScreenLoad("projectile6.bmp", maxx div 6, maxy div 3, picMerge)
    Pic.ScreenLoad("projectile7.bmp", 2 * (maxx div 6), (maxy div 3), picMerge)
    Pic.ScreenLoad("projectile8.bmp", 3 * (maxx div 6), (maxy div 3), picMerge)
    Pic.ScreenLoad("projectile9.bmp", 4 * (maxx div 6), (maxy div 3), picMerge)
    Pic.ScreenLoad("projectile10.bmp", 5 * (maxx div 6), (maxy div 3), picMerge)
    
    moveText (intstr(1), 0.15, 2 * (maxy div 3), font2, blue)
    moveText (intstr(2), 0.32, 2 * (maxy div 3), font2, blue)
    moveText (intstr(3), 0.49, 2 * (maxy div 3), font2, blue)
    moveText (intstr(4), 0.65, 2 * (maxy div 3), font2, blue)
    moveText (intstr(5), 0.81, 2 * (maxy div 3), font2, blue)
    moveText (intstr(6), 0.15, (maxy div 3), font2, blue)
    moveText (intstr(7), 0.32, (maxy div 3), font2, blue)
    moveText (intstr(8), 0.49, (maxy div 3), font2, blue)
    moveText (intstr(9), 0.65, (maxy div 3), font2, blue)
    moveText (intstr(10), 0.81, (maxy div 3), font2, blue)
end showProjectiles

proc selectProjectile
    get select
    if select = 0 then
        randint (select, 1, 10)
        if select = 1 then 
            Projectile := Sprite.New (projectile1)
        elsif select = 2 then 
            Projectile := Sprite.New (projectile2)
        elsif select = 3 then 
            Projectile := Sprite.New (projectile3)
        elsif select = 4 then
            Projectile := Sprite.New (projectile4)
        elsif select = 5 then 
            Projectile := Sprite.New (projectile5)
        elsif select = 6 then 
            Projectile := Sprite.New (projectile6)
        elsif select = 7 then 
            Projectile := Sprite.New (projectile7)
        elsif select = 8 then 
            Projectile := Sprite.New (projectile8)
        elsif select = 9 then 
            Projectile := Sprite.New (projectile9)
        elsif select = 10 then 
            Projectile := Sprite.New (projectile10)
        end if
    elsif select = 1 then 
        Projectile := Sprite.New (projectile1)
    elsif select = 2 then 
        Projectile := Sprite.New (projectile2)
    elsif select = 3 then 
        Projectile := Sprite.New (projectile3)
    elsif select = 4 then
        Projectile := Sprite.New (projectile4)
    elsif select = 5 then 
        Projectile := Sprite.New (projectile5)
    elsif select = 6 then 
        Projectile := Sprite.New (projectile6)
    elsif select = 7 then 
        Projectile := Sprite.New (projectile7)
    elsif select = 8 then 
        Projectile := Sprite.New (projectile8)
    elsif select = 9 then 
        Projectile := Sprite.New (projectile9)
    elsif select = 10 then 
        Projectile := Sprite.New (projectile10)
    end if 
end selectProjectile

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
    Sprite.Show (Projectile)
    Sprite.Show(Vmark)
    Sprite.Show(Hmark)
    
    if height1 > 0 then
        loop
            xpoint := ((horizontalvel1 * timecount)) * (hscale)
            ypoint := (height1 + ((verticalvel1 * timecount) + ((g / 2) * timecount * timecount))) * (vscale)
            timecount := timecount + 0.01
            Sprite.SetPosition (Projectile, floor(xpoint), floor(ypoint), true)
            Sprite.SetPosition (Hmark, floor(xpoint), 0, true)
            Sprite.SetPosition (Vmark, 0, floor(ypoint), true)
            drawfilloval(floor (xpoint), floor (ypoint), 1, 1, black)
            delay (10)
            exit when
            timecount > totaltime
        end loop
    elsif height1 = 0 then 
        loop
            xpoint := ((horizontalvel1 * timecount)) * (hscale)
            ypoint := (((verticalvel1 * timecount) + ((g / 2) * timecount * timecount))) * (hscale)
            timecount := timecount + 0.01
            Sprite.SetPosition (Projectile, floor(xpoint), floor(ypoint), true)
            Sprite.SetPosition (Hmark, floor(xpoint), 0, true)
            Sprite.SetPosition (Vmark, 0, floor(ypoint), true)
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
    Sprite.Show (Projectile)
    Sprite.Show(Vmark)
    Sprite.Show(Hmark)
    
    loop
        xpoint := ((horizontalvel1 * timecount)) * (vscale)
        ypoint := (height1 + ((verticalvel1 * timecount) + ((g / 2) * timecount * timecount))) * (vscale)
        timecount := timecount + 0.01
        Sprite.SetPosition (Projectile, floor(xpoint), floor(ypoint), true)
        Sprite.SetPosition (Hmark, floor(xpoint), 0, true)
        Sprite.SetPosition (Vmark, 0, floor(ypoint), true)
        drawfilloval(floor (xpoint), floor (ypoint), 1, 1, black)
        delay (10)
        exit when
        timecount > totaltime
    end loop
end plottingmore45

process dataDisplay
    vVelocity := 0
    
    moveText ("Vertical Velocity (m/s):", 0.95, (maxy - (maxy div 6)) + (maxy div 10), font, blue)
    moveText ("Velocity (m/s):", 0.7, (maxy - (maxy div 6)) + (maxy div 10), font, blue)
    moveText ("Time (s):", 0.5, (maxy - (maxy div 6)) + (maxy div 10), font, blue)
    moveText ("Position (m) (x,y):", 0.3, (maxy - (maxy div 6)) + (maxy div 10), font, blue)
    
    loop
        vVelocity := verticalvel1 + (g * timecount)
        delay (20)
        drawfillbox((maxx div 2) - (maxx div 3.5), (maxy - (maxy div 6)) + (maxy div 25), (maxx div 2) + (maxx div 2), (maxy - (maxy div 6)) + (maxy div 11), white)
        moveText (realstr(vVelocity, (maxx div maxy)), 0.9, (maxy - (maxy div 6)) + (maxy div 20), font, blue)
        moveText (realstr(sqrt((vVelocity * vVelocity) + (horizontalvel1 * horizontalvel1)), (maxx div maxy)), 0.7, (maxy - (maxy div 6)) + (maxy div 20), font, blue)
        moveText (realstr(timecount, (maxx div maxy)), 0.5, (maxy - (maxy div 6)) + (maxy div 20), font, blue)
        moveText (intstr(floor(horizontalvel1 * timecount), (maxx div maxy)), 0.3, (maxy - (maxy div 6)) + (maxy div 20), font, blue)
        moveText (intstr(floor((height1 + ((verticalvel1 * timecount) + ((g / 2) * timecount * timecount)))), (maxx div maxy)), 0.35, (maxy - (maxy div 6)) + (maxy div 20), font, blue)
        moveText ("(            ,            )", 0.308, (maxy - (maxy div 6)) + (maxy div 20), font, blue)
        exit when
        timecount > totaltime
    end loop
end dataDisplay
%//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
proc projectileSimulation
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
    
    put "Enter the number of the projectile you want in the animation"
    put "Enter 0 for random projectile"
    
    showProjectiles
    selectProjectile
    
    put "Press space bar to procede"
    
    nextscreen
    cls
    
    put "Total Velocity at launch: ", velocity1, " m/s"
    put "Angle of launch: ", anglev1, " degrees"
    put "Height at laucnh: ", height1, " m"
    put "Horizontal velocity at launch: ", horizontalvel1, " m/s"
    put "Vertical velocity at launch: ", verticalvel1, " m/s"
    put "Max heigt of the projectile: ", maxh, " m"
    put "Duration of the flight: ", totaltime, " s"
    put "Horizontal range: ", deltadx, " m"
    put "Final vertical velocity: ", verticalvel2, " m/s"
    put "Final total velocity: ", velocity2, " m/s"
    
    maxdeltadx
    verticalscale
    horizontalscale  
    
    drawbox (0, 0, hdimension, vdimension, black)
    
    if anglev1 <= 62 then 
        fork plottingless45
        fork dataDisplay
        drawbox (0,0, maxx div 42, floor (height1 * vscale), black)
    elsif anglev1 > 62 then
        fork plottingmore45
        fork dataDisplay
        drawbox (0,0, maxx div 42, floor (height1 * vscale), black)
    end if
end projectileSimulation
%//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

projectileSimulation
