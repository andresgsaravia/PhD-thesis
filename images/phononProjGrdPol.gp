# Plots for the "../datasets/*/phonoProjGrd.mat" and
# "../datasets/*/phonoProjPol.mat" data files 
# Output is produced in "../images/phononProjGrdPol.tex"
reset
set encoding utf8
set t epslatex color colortext size 14cm,8cm
cd '../'                 # We need to move to the main.tex path to avoid some silly issues...
set output 'images/phononProjGrdPol.tex'

unset colorbox
set format x '\scriptsize %g'
set format y '\scriptsize %g'
set lmargin 1
set rmargin 0
set border 3
set tics out nomirror

uir = 0.071929
uR = 0.06492
set xrange[-6*uir:6*uir]
set yrange[-6*uR:6*uR]
set xtics 0.2
set ytics 0.1

set multiplot
set size 0.33, 0.5

# Grd phonons. Top row
set tmargin 2
set bmargin 0.5
set xlabel ''
set ylabel "$u_{R}$ (\\AA)" offset 4
set origin 0, 0.5
set label 1 '\scriptsize{$\lambda_{ir} = 0.00$ eV}' at screen 0.10, screen 0.96
plot 'datasets/0.00/phononProjGrd.mat' u ($1-60)*uir/10:($2-60)*uR/10:3 matrix with image notitle
unset label 2

unset ytics
set format y ''
set ylabel ''
set origin 0.33, 0.5
set label 1 '\scriptsize{$\lambda_{ir} = 0.1263$ eV}' at screen 0.43, screen 0.96
plot 'datasets/0.1263/phononProjGrd.mat' u ($1-60)*uir/10:($2-60)*uR/10:3 matrix with image notitle

set xlabel ''
set origin 0.66, 0.5
set label 1 '\scriptsize{$\lambda_{ir} = 0.25$ eV}' at screen 0.76, screen 0.96 
plot 'datasets/0.25/phononProjGrd.mat' u ($1-60)*uir/10:($2-60)*uR/10:3 matrix with image notitle

# Pol phonons. Bottom row
set tmargin 0.5
set bmargin 2
set tics out nomirror
set ytics 0.1
set format y '\scriptsize %g'
set xlabel ''
set ylabel "$u_{R}$ (\\AA)" offset 4
set origin 0, 0
plot 'datasets/0.00/phononProjPol.mat' u ($1-60)*uir/10:($2-60)*uR/10:3 matrix with image notitle

unset ytics
set format y ''
set xlabel "$u_{ir}$ (\\AA)"
set ylabel ''
set origin 0.33, 0
plot 'datasets/0.1263/phononProjPol.mat' u ($1-60)*uir/10:($2-60)*uR/10:3 matrix with image notitle

set xlabel ''
set origin 0.66, 0
plot 'datasets/0.25/phononProjPol.mat' u ($1-60)*uir/10:($2-60)*uR/10:3 matrix with image notitle

unset multiplot
set output
set term pop