# Plot for the infrared excitations only in the"../datasets/energies.txt" data
# Output is produced in "../images/irSpectra.tex"
reset
set encoding utf8
set t epslatex color colortext size 12cm,8cm
cd '../'                 # We need to move to the main.tex path to avoid some silly issues...
set output 'images/irSpectra.tex'

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
set ylabel '$\omega_i$ (cm$^{-1}$)'
set xrange[0:0.25]
set xtics 0.05
set yrange[0:2000]
set ytics 250

set arrow 1 from 0.1263, graph 0 to 0.1263, graph 1 nohead lw 1
set label 1 '\scriptsize$\lambda_{ir}=0.1263$' at graph 0.52, graph 0.92
plot 'datasets/energies.txt'  u 1:4  with lines notitle ls 2,\
     'datasets/energies.txt'  u 1:6  with lines notitle ls 2,\
     'datasets/energies.txt'  u 1:7  with lines notitle ls 5,\
     'datasets/energies.txt'  u 1:10 with lines notitle ls 2,\
     'datasets/energies.txt'  u 1:11 with lines notitle ls 5,\
     'datasets/energies.txt'  u 1:12 with lines notitle ls 6,\
     612.4 notitle lw 1 

set output