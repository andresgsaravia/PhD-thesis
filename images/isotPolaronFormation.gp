# Plot for the "../datasets/isotPolaronFormation.txt" data file
# Output is produced in "../images/isotPolaronFormation.tex"
reset
set encoding utf8
set t epslatex color colortext size 12cm,7cm
cd '../'                 # We need to move to the main.tex path to avoid some silly issues...
set output 'images/isotPolaronFormation.tex'

# color definitions
set border linewidth 1.5
set style line 1 lc rgb '#800000' lt 1 lw 3
set style line 2 lc rgb '#ff0000' lt 1 lw 2
set style line 3 lc rgb '#ff4500' lt 1 lw 2
set style line 4 lc rgb '#ffa500' lt 1 lw 2
set style line 5 lc rgb '#006400' lt 1 lw 2
set style line 6 lc rgb '#0000ff' lt 1 lw 2
set style line 7 lc rgb '#9400d3' lt 1 lw 2
# Axes
set style line 11 lc rgb '#505050' lt 1
set border 3 back ls 11
set tics nomirror out scale 0.75
# Grid
set style line 12 lc rgb'#808080' lt 0 lw 1
set grid back ls 12


set xlabel '$\lambda_{ir}$ (eV)'
set ylabel '$\Delta_g (meV)$
set xrange[0:0.25]
set xtics 0.05
set yrange[5:11]
set ytics 1

set arrow 1 from 0.1263, graph 0 to 0.1263, graph 1 nohead lw 1
set label 1 '\scriptsize$\lambda_{ir}=0.1263$' at graph 0.52, graph 0.12
plot 'datasets/isotPolaronFormation.txt'  u 1:2 with lines notitle ls 6

set output