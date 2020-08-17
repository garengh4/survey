CSRS-PPP
Before uploading the .obs file from the RPAS to the NRC CSRS-PPP service, use a text editor (e.g. Notepad++) to check & edit the .obs file
1) Delete the first set of GNSS data as it is typically no good anyway.
2) Ensure dates/times in header match the observation start time and end times in the GNSS data below. Note all dates are UTC.
3) Delete the last 3 lines in the file including the ‘END OF…” line
4) Add a blank space between all time stamps 000000 0 to shift the lone zero to column 32. (Open Notepad -> FIND -> Find all “000000 0” + replace with “000000 0”)
5) (optional step) Add the following line immediate above TIME OF FIRST OBS line
0.2000 INTERVAL
Convert the file type to .txt (or leave as .obs)
Upload the file to the NRC website (https://webapp.geod.nrcan.gc.ca/geod/tools-outils/ppp.php?locale=en):
Select:
· Kinematic
· NAD83 Canadian Spatial Reference System
· Epoch can be from rinex file (Epoch of GPS data)
· Vertical datum (Geoid) = CGVD2013
When the processed XXX.pos file comes back, open in Notepad and save as file name and type Rinex.txt

MATLAB
Find the timestamp.MRK file from the DJI RTK flight data and rename this file Timestamp.txt
Matlab
Place Rinex.txt, Images.txt, and Timestamp.txt files into the same folder as the Matlab code. Open the Matlab code and click on ‘run’ to generate a new text file called UAV_camera_coords_XXX.txt
The UAV_camera_coords_XXX.txt file will have one row for each photo with: Image Name, Easting, Northing, Elevation. The XXX is the number of photos in the set. (you may need to delete 3 columns from this file)
If combining multiple flights into one model - Gridded Flight Patterns work best:
This .txt file can now be combined with other UAV_camera_coords files in Notepad. Make sure to copy ALL data from the first flight’s UAV_camera_coords file and paste into a Notepad document. Repeat this for all flights, with each flights data added to the bottom of the document. It is necessary to follow sequential order of flights, with the oldest flight on top and the most recent flight on bottom. Save the Notepad document as UAV_camera_coords_all.
Place all .jpeg images from multiple flights into one folder. The sequence of images in this folder needs to match the order in UAV_camera_coords_all. Default folder settings seem to work, but ensure they match. Pix4d matches the first .jpeg you select later to the first line from UAV_camera_coords_all.

Pix4D
Coordinate System – do this twice, once for import of camera locations and once for output of Pix4D model (you may need to do this a 3rd time if picking and exporting GCP coordinates)
Enter Image Properties Editor
· Edit
· Turn on Advanced Coordinate Options
· Activate Known Coordinate System
· Select Datum from list – NAD83 Canadian Spatial Reference System
· Select from Coordinate System – NAD83(CSRS) and UTM zone 11 or 10 N (change it to where you are)
· Use arbitrary geoid (Pix4D will use the elevations given to the cameras in CGVD2013 system
· Ensure output coordinate system is also NAD83(CSRS) / UTM zone 11 or 10 N (change it to where you are)
Geolocated Images
Import using ‘From File’
Use X,Y,Z and select UAV_camera_coords_XXX.txt
Edit the image accuracy: use 0.100 m for horizontal and 0.150 m for vertical (right mouse click on a cell to change the whole column)


