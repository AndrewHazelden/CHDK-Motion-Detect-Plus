--[[
@title Motion Detect Plus
rem Version 0.3.1 - Sept 16, 2012
rem Build 27

rem This file is a CHDK LUA script and should have the name "motionp.lua"

rem by Andrew Hazelden
rem email:	andrewhazelden@gmail.com 
rem blog:	www.andrewhazelden.com

rem This script adds a repetitive shot mode and is
rem based upon the standard "motion.lua" script

rem Make sure to disable Review Mode in the Canon menus.

rem Standard sensitivity threshold levels: 12=Sun 24=Cloudy 36=Dawn/Dusk

rem If the camera takes photos continuously increase the
rem threshold setting level for a reduced motion detection
rem responsiveness. 

rem (a higher motion threshold number = lower responsiveness)

rem Version History
rem ---------------

rem Version 0.3.1
rem Sept 16, 2012
rem Changed the zones variable to avoid a naming conflict.
rem Added a "Number of Shots" variable that takes a burst of photos
rem during a motion detection event.

rem Version 0.3
rem Aug 20, 2012
rem Improved motion threshold settings

rem Version 0.2
rem Created June 25, 2012
rem Added a "Motion Threshold" parameter

rem Version 0.1
rem Created on Feb 26, 2012
rem Initial Release of Motion Detect Plus

@param f Motion Threshold
@default f 24
@range f 0 100

rem Script start delay values
@param y Start Delay (min)
@default y 0
@param z Start Delay (sec)
@default z 3

rem default number of shots taken during a motion detection event
@param w Number of Shots
@default w 1

@param g Draw Grid 0=No 1=Yes
@default g 1
@range g 0 1

@param a Grid Columns
@param b Grid Rows
@default a 3
@default b 3

@param i Region 0=No 1=In 2=Out
@default i 0
@range i 0 2

rem Enabled grid cells
@param j Start Column
@param l End Column
@param k Start Row
@param m End Row
@default j 0
@default k 0
@default l 0
@default m 0

--]]

shots=0		-- photos taken counter


-- make sure number of shots is positive
if w<0 then
  w=1
end
num_shots = w


-- make sure the start column is smaller then the end column
if j>l then
 j=l
end

-- make sure the start row is smaller then the end row
if k>m then
 k=m
end

--make sure the region number is valid
if i>2 then
 i=0
end

-- Motion detection variables
-- a=6		 -- columns to split picture into 
-- b=6		 -- rows to split picture into 
c=1			-- measure mode (Y,U,V R,G,B) U=0, Y=1, V=2, R=3, G=4, B=5
d=300000	-- timeout (mSec) 
e=200		-- comparison interval (msec) - less than 100 will slow down other CHDK functions
-- f=5		   -- threshold (difference in cell to trigger detection)
-- g=1		 -- draw grid (0=no, 1=yes)	  
h=0			-- not used in LUA - in uBasic is the variable that gets loaded with the number of cells with motion detected
-- i=0		   -- region masking mode: 0=no regions, 1=include, 2=exclude
-- j=0		   --	   first column
-- k=0		   --	   first row
-- l=0		   --	   last column
-- m=0		   --	   last row
n=0			-- optional parameters	(1=shoot immediate)
o=2			-- pixel step
p=0			-- triggering delay (msec) 

-- Other variables

-- r=get_tick_count()  -- beginning of script timer value

-- Start the delay timer
cls()
print("Typical Motion Threshold")
print("12=Sun 24=Cloudy 36=Dawn")

if y>0 then
	print( y .. " min " .. z .. " sec to start...")
else
	print( z .. " sec to start...")
end

sleep( (z*1000)+(y*1000*60) )

-- Start the motion detection loop
cls()
print("Starting Motion Detection")
play_sound(3)	--plays the self timer sound effect

repeat
	md_zone = md_detect_motion( a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p)
	cls()
	
	--check if the md_zone value is nil due to pausing the script
	if( md_zone ~= nil) then
		if( md_zone > 0 ) then
			--shoot multiple photos in a burst using (Number of Shots)
			if(num_shots>0) then
				burst = num_shots
				repeat
					shoot() 
					cls()
					shots=shots+1  -- Increment the shots taken counter
					burst=burst-1  -- update the photo burst counter
				until ( burst==0 )
				print(shots .. " Shots Taken" )
				sleep(250)
			end
		end
	end
until ( false )
