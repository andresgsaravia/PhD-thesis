# Plots for the
# "../datasets/uirCoupl.mat"
# "../datasets/uirCouplDist.mat"
# data files 
# Output is produced in "../images/uirCoupl.tex"
reset
set utf8
set t epslatex color colortex size 15cm, 7cm
cd '../'                 # We need to move to the main.tex path to avoid some silly issues...
set output 'images/uirCoupl.tex'

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
set border 1 back ls 11
set tics nomirror out scale 0.75
# Grid
set style line 12 lc rgb'#808080' lt 0 lw 1
set grid back ls 12

unset colorbox
set format x '\scriptsize %g'
set format y '\scriptsize %g'

uir = 0.071929
uR = 0.06492
set xrange[-6*uir:6*uir]
set yrange[-6*uR:6*uR]
set xtics 0.2

set bmargin at screen 0.15

set multiplot
set size 0.5,1
set ytics 0.02

# 3D plot of u_{ir} vs lambda_{ir} vs projected_wf
set origin 0,0
set xrange[-6*uir:6*uir]
set yrange[0:0.25]
set xlabel '$u_{ir}$ (\AA)'
set ylabel '$\lambda_{ir}$ (eV)' offset 4
unset colorbox

plot 'datasets/uirCoupl.mat' u ($1-60)*uir/10:($2/200):3 matrix with image notitle

# 2D plot of the cluster distortion vs lambda_{ir}
set origin 0.5,0
set yrange[0:0.25]
set xrange[-0.8:0.8]
set ylabel '$\lambda_{ir}$ (eV)'
set xlabel '$d$ (\AA)'
set grid

plot 'datasets/uirCouplDist.mat' u 2:1 notitle with lines ls 6,\
     'datasets/uirCouplDist.mat' u (-$2):1 notitle with lines ls 6
     

unset multiplot
set output
set term pop