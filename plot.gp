set terminal svg size 1600,800  enhanced background rgb 'white'
set output 'stat.svg'

set multiplot layout 2,1 rowsfirst

set style line 1 lc rgb '#0060ad' lt 1 lw 2 pt 7 pi -1 ps 0.5
set style line 2 lc rgb '#6000ad' lt 1 lw 2 pt 7 pi -1 ps 0.5

set title "System load"
set style data fsteps
set xlabel "Date\n"
set timefmt '%Y-%m-%d:%H:%M:%S'
set yrange [ 0 : 100.0]
set xdata time
set xtics rotate by 45 offset -3, -5
set ylabel "System load"
set format x "%Y-%m-%d:%H:%M:%S"
set grid
set key left
plot 'data' using 1:2 t 'Load' with lines ls 1

set title "Memory"
set style data fsteps
set xlabel "Date\n"
set timefmt '%Y-%m-%d:%H:%M:%S'
set yrange [ 0 : 12000 ]
set xdata time
set xtics rotate by 45 offset -3, -5
set ylabel "Memory in MB"
set format x "%Y-%m-%d:%H:%M:%S"
set grid
set key left
plot 'data' using 1:3 t 'Memory'  with lines ls 2
