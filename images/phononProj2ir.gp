# Plots for the "../datasets/*/phonoProj2ir.mat" data files 
# Output is produced in "../images/phononProj2ir.tex"
reset
set encoding utf8
set t epslatex color colortext size 15cm,5cm
cd '../'                 # We need to move to the main.tex path to avoid some silly issues...
set output 'images/phononProj2ir.tex'

unset colorbox
set format x '\scriptsize %g'
set format y '\scriptsize %g'
set xlabel "$u_{ir}$ (\\AA)"

uir = 0.071929
uR = 0.06492
set xrange[-6*uir:6*uir]
set yrange[-6*uR:6*uR]
set xtics 0.2

set multiplot

set ylabel "$u_{R}$ (\\AA)"
set size 0.38, 1
set origin 0, 0
set label 1 '$\lambda_{ir} = 0.00$ eV' at screen 0.13, screen 0.96
plot 'datasets/0.00/phononProj2ir.mat' u ($1-60)*uir/10:($2-60)*uR/10:3 matrix with image notitle

set format y ''
set ylabel ''
set size 0.305, 1
set origin 0.34, 0
set label 1 '$\lambda_{ir} = 0.1263$ eV' at screen 0.4, screen 0.96
plot 'datasets/0.1263/phononProj2ir.mat' u ($1-60)*uir/10:($2-60)*uR/10:3 matrix with image notitle

set size 0.35,1
set colorbox
set origin 0.645, 0
set label 1 '$\lambda_{ir} = 0.25$ eV' at screen 0.7, screen 0.96 
plot 'datasets/0.25/phononProj2ir.mat' u ($1-60)*uir/10:($2-60)*uR/10:3 matrix with image notitle

unset multiplot
set output
set term pop