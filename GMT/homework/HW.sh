out_ps=HW.ps
input_list=water.csv
  
gmt set PS_MEDIA A4 
  
# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps 
  
# Main map
gmt psbasemap -R119/123/21/26 -Jm3 -B1 -G0/250/250 -X-0.5 -Y5 -O -K >> $out_ps
gmt pscoast -R -J -B -W1 -G250/250/0 -Df -Ia -O -K >> $out_ps

  
# Bottom map
gmt psbasemap -R119/123/0/315 -Jx3/-0.01 -B -X0 -Y-5 -O -K >> $out_ps
  
# Right map
gmt psbasemap -R0/315/21/26 -Jx0.01/3.25 -B -X14 -Y5 -O -K >> $out_ps
  
# end gmt session
gmt psxy -R -J -O -T >> $out_ps 
  
# convert to pdf
gmt psconvert $out_ps -P -Tf
# convert to png
gmt psconvert $out_ps -P -Tg
gmt pslegend -R0/4/0/3.75 -Jx -O -DjBL+w1.2i+o0.25i -F+glightgray+pthicker \
	--FONT_ANNOT_PRIMARY=14p,Helvetica-Bold << EOF >> HW.ps
S 0.1i T 0.07i black - 0.3i reservoir
S 0.1i c 0.07i black - 0.3i Satellite
EOF