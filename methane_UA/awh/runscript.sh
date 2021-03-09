#!/bin/bash

for i in {1..6}
do
  cd set${i}
  if [ ! -f topol.tpr ]
  then
    gmx grompp -f ../grompp.mdp -p ../topol.top -c $i.gro
  fi
  if [ ! -f confout.gro ]
  then
    gmx mdrun -nt 4 -cpi -v
  fi
  cd ..
done
