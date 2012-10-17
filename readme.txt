CHDK Motion Detect Plus Script
Version 0.3.1 Build 27 Released Sept 16, 2012 

Created by Andrew Hazelden
email:  andrewhazelden@gmail.com  
blog:   www.andrewhazelden.com/

I created a new CHDK motion detection script called "Motion Detect Plus" to take repetitive shots with motion detection.

This Motion Detect Plus script adds a repetitive shot feature to the standard CHDK "motion.lua" script. This is useful for compiling a motion time-lapse sequence using motion detection to trigger the photos instead of a traditional intervalometer.

The script is called motionp.lua and should work with most cameras that support CHDK.

You can download the latest version of the CHDK Motion Detect Plus script from:
http://www.andrewhazelden.com/blog/2012/02/chdk-motion-detect-plus-script/

Version History

Version 0.3.1 - Sept 16, 2012
Changed the zones variable to avoid a naming conflict.
Added a "Number of Shots" variable that takes a burst of photos
during a motion detection event.

Version 0.3 Released Aug 20, 2012
Improved Motion Threshold settings

Version 0.2 Released June 25, 2012
Added a "Motion Threshold" parameter

Version 0.1 Released Feb 26, 2012
Initial Release of Motion Detect Plus


Script Controls

There are several settings that can be set in the CHDK Script preferences:

The setting "Motion Threshold" controls the responsiveness of the motion detection feature. If the camera takes photos continuously increase the motion threshold setting level for a reduced motion detection response. 

Here are several typical motion threshold levels: 
12=Sun 24=Cloudy 36=Dawn/Dusk

You can set a start delay in minutes and seconds. This gives you time to set up your shot before the motion detection is enabled.

The "Number of Shots" variable takes a burst of photos during a motion detection event. This gives you a better chance of catching interesting photos when the motion detection trigger is set off.

The hollow boxes onscreen are the detection grid. You can choose to show or hide the detection grid.

You can set up a detection grid by defining the number of Grid Columns and Grid Rows. Once the grid is defined you can enable specific cells in the detection grid by specifying the Start Column / End Column and Start Row / End Row values.

The region value controls the motion detection masking zones. The region value can then be set to either:
0 = No (disable regions)
1 = In (The area inside the start / end region is the detection zone)
2 = Out (The area outside the start / end region is the detection zone).


Note: Make sure to disable "Review Mode" in the Canon menus.

Script Installation

1. Copy the MotionP.lua script to the CHDK scripts folder on your SD memory card.

2. Start CHDK and from the ALT Menu open the "Scripting Parameters" Menu. In the script window select the "Load Script from File..." menu option. Then in the "Select Script File" window select the MOTIONP.LUA script and press the Func. Set button to load the script.

3. Set the script parameters for Motion Detect Plus and define your motion detection grid size, and masking region settings.

4. Exit the CHDK Menus and start the Motion Detect Plus script by pressing the shutter button when the text ALT is displayed on screen. If you enabled a Start Delay period the camera will play a short beeping noise to indicate when the start delay period is over.

The grey rectangles on the LCD screen show the active motion detection regions. If motion occurs within one of the selected rectangles a new photo will be taken.

The script will display a counter showing how many photos have been taken since the script was started.

The Motion Detect Plus photo counter looks like this:
3 Shots Taken
Motion Detect Plus <ALT>

5. You can stop the script at any point by pressing the shutter button.