# variables to export for any *nix computer 
export EDITOR="emacs -nw"
OMP_NUM_THREADS=1
export OMP_NUM_THREADS=$OMP_NUM_THREADS


# Variables to export for lagrange
if [[ ${(%):-%M} = *Lagrange* ]]; then
   export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH # Export path for MB-system (for plotting bathymetry data)
   export PATH=/usr/lib/gmt/bin:$PATH
   export PATH=/home/awesome/tmp/marcs_code/dg/code/scripts:$PATH
   export PYTHONPATH=/home/awesome/code/marcs_code/dg/code/scripts:/home/awesome/dotfiles/python:$PYTHONPATH
   export CUDA_HOME=/usr/local/cuda-7.5
   export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH
   export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH
   PATH=${CUDA_HOME}/bin:${PATH} 
   export DISSPATH=/hdd/Users/awesome/Dropbox/Research/papers,etc/dissertation
fi

## Terminal aliases specifically for My laptop
if [[ $HOSTNAME = *TheWhiteRabbit* ]]; then
   export DISPLAY=127.0.0.1:0.0
fi


