#!/bin/bash
for i in {0..19}
do
  cd $i
  gmx grompp -f ../grompp.mdp -p ../../topol.top -c ../../equil/confout.gro
done
mpirun -np 20 gmx_mpi mdrun -multidir {0..19} -cpi
