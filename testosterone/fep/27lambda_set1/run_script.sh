#!/bin/bash

# The init_* runs were used to optimize the lambda state pathway.
prev=../../../conf.gro
for i in {20..0}
do
  cd init_$i
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
    gmx mdrun -cpi
  fi
  prev=../init_$i/confout.gro
  cd ..
done

# For each new lambda state (0..26) there is a mapping to the closest lambda state from the initialization stage
# in order to select the most similar state and thereby reduce the required equilibration times.
for i in {26..0}
do
  cd $i
  mapping=`cat prev_state_mapping.txt`
  prev=../init_$mapping/confout.gro
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
    gmx mdrun -cpi
  fi
  cd ..
done
