#!/bin/bash
for i in {0..15}
do
  cd $i
  gmx grompp -f ../grompp.mdp -p ../../../topol.top -c ../../../confout.gro
done
mpirun -np 16 gmx_mpi mdrun -multidir {0..15} -cpi
