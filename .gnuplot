# style the lines so they can be read more easily
set style line 1 lc rgb '#8b1a0e' pt 1 ps 1 lt 1 lw 2
set style line 2 lc rgb '#5e9c36' pt 6 ps 1 lt 1 lw 2
set style line 3 lc rgb '#268bd2' pt 1 ps 1 lt 1 lw 2
set style line 4 lc rgb '#000000' pt 6 ps 1 lt 1 lw 2

# set grid style
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror

# display a slight grid
set style line 12 lc rgb '#808080' lt 0 lw 1
set grid back ls 12

# vim: syntax=gnuplot
