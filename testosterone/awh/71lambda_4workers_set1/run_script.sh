#!/bin/bash
for i in {0..3}
do
  cd $i
  gmx grompp -f ../grompp.mdp -p ../../../topol.top -c ../../../confout.gro
done
mpirun -np 4 gmx_mpi mdrun -multidir {0..3} -cpi
