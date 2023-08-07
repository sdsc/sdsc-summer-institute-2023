### SDSC Summer Institute 2023
# Session 2.5 Interactive Computing

**Date:** Monday, August 7, 2023

**Summary**: Interactive computing refers to working with software that accepts input from the user as it runs. This applies not only to business and office applications, such as word processing and spreadsheet software, but HPC use cases involving code development, real-time data exploration and advanced visualizations run across one or more compute nodes. Interactive computing is often used when applications require large memory, have large data sets that are not that practical to download to local devices, need access to higher core counts or rely on software that is difficult to install. User inputs are entered via a command line interface (CLI) or application GUI (e.g., Jupyter Notebooks, Matlab, RStudio). Actions are initiated on remote compute nodes as a result of user inputs.  This session will introduce participants to advanced CI concepts and what’s going on "under the hood" when they are using interactive tools.  Topics covered will include mechanisms for accessing interactive resources; commonalities and differences between batch and interactive computing; understanding the differences between web-based services and X11/GUI applications; monitoring jobs running on interactive nodes; overview of Open OnDemand portals.

**Presented by:** [Mary Thomas](https://www.sdsc.edu/research/researcher_spotlight/thomas_mary.html) (mpthomas @ucsd.edu)

### Reading and Presentations:
* **Lecture material:**
   * Presentation Slides: will be made available closer to the session
* **Source Code/Examples:** N/A
   * SDSC HPC Training Examples Repo @ [https://github.com:sdsc-hpc-training-org/hpctr-examples.git](https://github.com:sdsc-hpc-training-org/hpctr-examples.git)
   * Expanse 101 tutorial: https://hpc-training.sdsc.edu/expanse-101/

### TASK 1: Clone the repo
   * Clone the  SDSC HPC Training Examples Repo @ [https://github.com:sdsc-hpc-training-org/hpctr-examples.git](https://github.com:sdsc-hpc-training-org/hpctr-examples.git)

### TASK 2: Hands-on: Interactive Computing on CPU Node
#### Use the srun command to get an interactive CPU node:
```
[mthomas@login02 calc-prime]$ srun --partition=compute  --pty --account=use300 --nodes=1 --ntasks-per-node=128 --mem=8G -t 00:30:00 --wait=0 --export=ALL /bin/bash
srun: job 24459379 queued and waiting for resources
srun: job 24459379 has been allocated resources
[mthomas@exp-6-16 calc-prime]$
```
* Set up the module ENV:
```
module purge 
module load slurm
module load cpu
module load gcc/10.2.0
module load openmpi/4.1.1
```
* list the modules
```
[mthomas@exp-6-16 calc-prime]$ module list
Currently Loaded Modules:
  1) slurm/expanse/21.08.8       3) gcc/10.2.0/npcyll4   5) openmpi/4.1.1/ygduf2r
  2) cpu/0.17.3b           (c)   4) ucx/1.10.1/dnpjjuc
  Where:
   c:  built natively for AMD Rome
```
#### Run calc-prime from the command line
```
mpirun -np 16 ./mpi_prime 500000
07 August 2023 01:36:28 AM

PRIME_MPI
 n_hi= 262144
  C/MPI version

  An MPI example program to count the number of primes.
  The number of processes is 16

         N        Pi          Time

         1         0        0.000817
         2         1        0.000583
         4         2        0.000004
         8         4        0.000004
        16         6        0.000004
        32        11        0.000004
        64        18        0.000004
       128        31        0.000005
       256        54        0.000008
       512        97        0.000018
      1024       172        0.000054
      2048       309        0.000189
      4096       564        0.000638
      8192      1028        0.002281
     16384      1900        0.008125
     32768      3512        0.029826
     65536      6542        0.111391
    131072     12251        0.415458
    262144     23000        1.543699
    524288     43390       23.354061

PRIME_MPI - Master process:
  Normal end of execution.

07 August 2023 01:44:11 AM
```

### TASKS: None at this time.

[Back to Top](#top)
