# variables to export for any ubuntu computer 
export EDITOR="emacs -nw"
OMP_NUM_THREADS=1
export OMP_NUM_THREADS=$OMP_NUM_THREADS


# Variables to export specifically for lagrange
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH # Export path for MB-system (for plotting bathymetry data)
export PATH=/usr/lib/gmt/bin:$PATH
export PATH=/home/awesome/tmp/marcs_code/dg/code/scripts:$PATH
export PYTHONPATH=/home/awesome/tmp/marcs_code/dg/code/scripts:$PYTHONPATH
export CUDA_HOME=/usr/local/cuda-7.5
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH
PATH=${CUDA_HOME}/bin:${PATH} 
export PATH
