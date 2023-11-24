#!/bin/bash

source $1/amber22/amber.sh

parmchk2 -i ligand_files/PPO.mol2 -f mol2 -o ligand_files/PPO.frcmod
parmchk2 -i ligand_files/CMB.mol2 -f mol2 -o ligand_files/CMB.frcmod

cd Prep_environment
$1/amber22/bin/tleap -f PPO.in
$1/amber22/bin/tleap -f CMB.in
$1/amber22/bin/tleap -f complex.in
cd ..

ambpdb -p TXS-cmbrn15.prmtop -c TXS-cmbrn15.inpcrd > TXS-cmbrn15_solvated.pdb
