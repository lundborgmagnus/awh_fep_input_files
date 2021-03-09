#!/bin/bash

prev=../../../equil/confout.gro
for i in {15..0}
do
  cd $i
  if [ ! -f topol.tpr ]
  then
    gmx grompp -c $prev -p ../../../topol.top
  fi
  if [ ! -f confout.gro ]
  then
    if [ ! -f $prev ]
    then
      exit
    fi
    gmx mdrun -cpi -nt 4
  fi
  prev=../$i/confout.gro
  cd ..
done

for i in {15..0}
do
  cd $i
  gmx convert-tpr -s topol.tpr -o topol.tpr -nsteps 9500000
  gmx mdrun -cpi -nt 4
  cd ..
done

