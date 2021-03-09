#!/bin/bash
for i in {0..47}
do
  cd $i
  gmx grompp -f ../grompp.mdp -p ../../../topol.top -c ../../../equil/confout.gro
done
mpirun -np 48 gmx_mpi mdrun -multidir {0..47} -cpi
