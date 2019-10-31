#!/bin/bash

# Copy ocean and ice .nc files to mdss

echo "WARNING: do not proceed if the model is still running."
read -p "Proceed? (y/n) " yesno
case $yesno in
    [Yy] ) ;;
    * ) echo "Cancelled. Wait until model has finished before trying again."; exit 0;;
esac

b=cosima/access-om2-01/01deg_jra55v13_ryf8485_spinup6

for d in output4??; do
    echo $d
    mdss mkdir $b/$d/ocean
    mdss mkdir $b/$d/ice/OUTPUT
    netcp -P v45 -p -m $d/ocean/*.nc $b/$d/ocean
    netcp -P v45 -p -m $d/ice/OUTPUT/*.nc $b/$d/ice/OUTPUT
#    mdss -P v45 put $d/ocean/*.nc $b/$d/ocean &
#    mdss -P v45 put $d/ice/OUTPUT/*.nc $b/$d/ice/OUTPUT &
#    break
done

