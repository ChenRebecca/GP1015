out_ps=HW.ps
input_list=water.list
  
cpt=homework.cpt
 
gmt set PS_MEDIA A4
 
gmt makecpt -T40/80/1 -Ccyclic -Z > $cpt

# start gmt session
gmt psxy -R0/1/0/1 -Jm1c -T -K -P > $out_ps 
  
# Main map
gmt psbasemap -R119/123/21/26 -Jm3 -B1 -G0/250/250 -X-0.5 -Y5 -O -K >> $out_ps
gmt psbasemap -R -J -B+t"Reservoir temperature" -O -K >>$out_ps
gmt pscoast -R -J -B -W1 -G220/220/220 -Df -Ia -O -K >> $out_ps
awk '{print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.1 -C$cpt -O -K >> $out_ps 


gmt psscale -C$cpt -DjRM+w3i/0.25i+o0.5i/0+mc -R -J -O -K -F+P+i  -B10 -By+l"K" >>$out_ps

# end gmt session 
gmt psxy -R -J -O -T >> $out_ps   
# convert to pdf
gmt psconvert $out_ps -P -Tf
# convert to png
gmt psconvert $out_ps -P -Tg

