export PATH="/cm/shared/apps/sdsc/galyleo:${PATH}"
SIMG='/expanse/lustre/projects/sds166/zonca/dask-numba-si22.sif'
# Summer institute account
# Use current folder
NOTEBOOK_FOLDER=$(pwd -P)
# Create link
cd 1_dask_tutorial
rm -f data
ln -s /expanse/lustre/projects/sds166/zonca/dask_tutorial_data data
cd ../
# Use the user home
# NOTEBOOK_FOLDER=${HOME}
#galyleo.sh launch --account $ACCOUNT --reservation ${RESERVATION} --partition 'compute' --cpus-per-task 128 --time-limit 02:45:00 --jupyter 'lab' --notebook-dir "${NOTEBOOK_FOLDER}" --env-modules 'singularitypro' --bind '/expanse,/scratch' --sif "${SIMG}"

galyleo launch --account ${SI23_ACCOUNT} --reservation ${SI23_RES_CPU} --partition compute --qos ${SI23_QOS_CPU} --cpus 128 --memory 243 --time-limit 04:00:00 --env-modules singularitypro --jupyter 'lab' --notebook-dir "${NOTEBOOK_FOLDER}" --sif ${SIMG} --bind '/cm,/expanse,/scratch' --quiet
