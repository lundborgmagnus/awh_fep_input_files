#!/bin/bash
for i in {0..95}
do
  cd $i
  gmx grompp -f ../grompp.mdp -p ../../../topol.top -c ../../../confout.gro
done
mpirun -np 96 gmx_mpi mdrun -multidir {0..95} -cpi
