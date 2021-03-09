cd 0
if [ ! -f topol.tpr ]
then
  gmx grompp -f grompp.mdp -c 1.gro -p ../../topol.top
fi
if [ ! -f confout.gro ]
then
  gmx mdrun -nt 4 -cpi -v
fi
cd ..
prev=0
for i in {1..7}
do cd $i
if [ ! -f topol.tpr ]
then
  gmx grompp -f grompp.mdp -c ../$prev/confout.gro -p ../../topol.top
fi
if [ ! -f confout.gro ]
then
  gmx mdrun -nt 4 -cpi -v
fi
cd ..
prev=$i
done
