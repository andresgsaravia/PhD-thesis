# Plot for the isotopic effect of infrared excitations in the"../datasets/isotShifts.txt" data
# Output is produced in "../images/irIsot.tex"
reset
set encoding utf8
set t epslatex color colortext size 10cm,10cm
cd '../'                 # We need to move to the main.tex path to avoid some silly issues...
set output 'images/irIsot.tex'

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
set format y '\scriptsize %g'
# Grid
set style line 12 lc rgb'#808080' lt 0 lw 1
set grid back ls 12
set lmargin 3
set rmargin 1
set tmargin 0

# Labels and range
set arrow 1 from 0.1263, graph 0 to 0.1263, graph 1 nohead lw 1
set label 1 '\scriptsize$\lambda_{ir}=0.1263$' at graph 0.52, graph 0.92
set xrange[0:0.25]
set xtics 0.02

set multiplot

# Top plot: First ir
set size 1,0.45
set origin 0,0.55
set bmargin 1
set xlabel ''
set format x ''
set ylabel '$\Delta_i$ (\%)' offset 3
set yrange[-25:5.2]
set ytics 5
plot 'datasets/isotShifts.txt'  u 1:2 with lines notitle ls 2 

# Bottom plot: all other ir
set size 1,0.55
set bmargin 4
set xlabel '$\lambda_{ir}$ (eV)'
set format x '\scriptsize %g'
set ylabel '$\Delta_i$ (\%)' offset 2
set origin 0,0
set yrange[0:7.9]
set ytics 1
plot 'datasets/isotShifts.txt'  u 1:3 with lines notitle ls 2,\
     'datasets/isotShifts.txt'  u 1:4 with lines notitle ls 5,\
     'datasets/isotShifts.txt'  u 1:7 with lines notitle ls 6 

unset multiplot
set output
set t pop
