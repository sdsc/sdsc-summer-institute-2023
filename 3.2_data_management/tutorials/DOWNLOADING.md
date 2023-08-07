## CIFAR through the tubes: Downloading data from the internet

*"the Internet is not ... a big truck. It's a series of tubes." -- Theodore Fulton Stevens Sr.* [:notes:](https://www.youtube.com/watch?v=_cZC67wXUTs) [:microphone:](https://en.wikipedia.org/wiki/Series_of_tubes)

<img src='../submarinecablemap.png' width='95%' height='55%'/>

[Image Credit: Submarine Cable Map](https://www.submarinecablemap.com/)

The aim of this tutorial is to introduce you to command-line tools that are useful for downloading data from the internet to your personal computer or an HPC system, and verifing the data is correct. The dataset we'll be working with is the [CIFAR-10 dataset](https://www.cs.toronto.edu/~kriz/cifar.html), a machine learning dataset that consists of 60K 32x32 colour images broken out into 10 classes, with 6000 images per class.

<!-- https://data.gov/

https://en.m.wikipedia.org/wiki/Zettabyte_Era

https://www.domo.com/data-never-sleeps

https://rivery.io/blog/big-data-statistics-how-much-data-is-there-in-the-world/

[CIFAR](https://www.cs.toronto.edu/~kriz/cifar.html)

https://en.wikipedia.org/wiki/CIFAR-10

https://datainnovation.org/2021/10/visualizing-undersea-internet-cables/

https://www.infrapedia.com/

https://en.wikipedia.org/wiki/Internet_backbone

https://www.submarinecablemap.com/

https://www.wired.com/story/opte-internet-map-visualization/

https://en.wikipedia.org/wiki/Wget

https://en.wikipedia.org/wiki/Tar_(computing)

https://en.wikipedia.org/wiki/Secure_Hash_Algorithms

https://csrc.nist.gov/projects/hash-functions

https://edps.europa.eu/sites/edp/files/publication/19-10-30_aepd-edps_paper_hash_final_en.pdf

https://www.okta.com/identity-101/hashing-algorithms/

https://www.geeksforgeeks.org/introduction-to-hashing-data-structure-and-algorithm-tutorials/

https://cheapsslsecurity.com/blog/decoded-examples-of-how-hashing-algorithms-work/

https://en.wikipedia.org/wiki/MD5

https://en.wikipedia.org/wiki/Md5sum

https://en.wikipedia.org/wiki/SHA-2

https://en.wikipedia.org/wiki/CURL -->


Let's get started by logging into Expanse with your training account either via the Expanse User Portal or directly via SSH from your terminal application. 

*Command:*
```
ssh trainXXX@login.expanse.sdsc.edu
```

*Output:*
```
mkandes@hardtack:~$ ssh train108@login.expanse.sdsc.edu
Password: 
Welcome to Bright release         9.0

                                                         Based on Rocky Linux 8
                                                                    ID: #000002

--------------------------------------------------------------------------------

                                 WELCOME TO
                  _______  __ ____  ___    _   _______ ______
                 / ____/ |/ // __ \/   |  / | / / ___// ____/
                / __/  |   // /_/ / /| | /  |/ /\__ \/ __/
               / /___ /   |/ ____/ ___ |/ /|  /___/ / /___
              /_____//_/|_/_/   /_/  |_/_/ |_//____/_____/

--------------------------------------------------------------------------------

Use the following commands to adjust your environment:

'module avail'            - show available modules
'module add <module>'     - adds a module to your environment for this session
'module initadd <module>' - configure module to be loaded at every login

-------------------------------------------------------------------------------
Last login: Sun Aug  6 16:30:09 2023 from 68.1.220.190
[train108@login02 ~]$
```

Once you are logged into Expanse, please go ahead and download the [CIFAR-10 dataset](https://en.wikipedia.org/wiki/CIFAR-10) using [wget](https://www.gnu.org/software/wget), a command-line program for retrieving files via HTTP, HTTPS, FTP and FTPS protocols.

*Command:*  
```
wget https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz
```

*Output:*

```
[train108@login02 ~]$ wget https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz
--2023-08-06 16:46:48--  https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz
Resolving www.cs.toronto.edu (www.cs.toronto.edu)... 128.100.3.30
Connecting to www.cs.toronto.edu (www.cs.toronto.edu)|128.100.3.30|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 170498071 (163M) [application/x-gzip]
Saving to: ‘cifar-10-python.tar.gz’

cifar-10-python.tar 100%[===================>] 162.60M  36.5MB/s    in 4.9s    

2023-08-06 16:46:55 (32.9 MB/s) - ‘cifar-10-python.tar.gz’ saved [170498071/170498071]

[train108@login02 ~]$
````

After the download completes, go ahead and list the files in your HOME directory using the [`ls`](https://en.wikipedia.org/wiki/Ls) command to check out how much data we've downloaded.

*Command:*

```
ls -lh
````

*Output:*

```
[train108@login02 ~]$ ls -lh
total 163M
-rw-r--r-- 1 train108 gue998 163M Jun  4  2009 cifar-10-python.tar.gz
lrwxrwxrwx 1 train108 gue998   32 Aug  6 14:45 data -> /cm/shared/examples/sdsc/si/2023
[train108@login02 ~]$
```

The dataset we've downloaded has been delieved to us as a [`gzip`](https://en.wikipedia.org/wiki/Gzip)-compressed `tar` file. To extract the dataset from the "tarball", use the [`tar`](https://en.wikipedia.org/wiki/Tar_(computing)) command.

*Command:*
```
tar -xf cifar-10-python.tar.gz
```

*Output:*

```
[train108@login02 ~]$ tar -xf cifar-10-python.tar.gz
[train108@login02 ~]$
```

With the data extracted from the tarball, let's go ahead and check out what's inside.

*Command:*

```
ls -lh
```

*Output:*

```
[train108@login02 ~]$ ls -lh
total 163M
drwxr-xr-x 2 train108 gue998   10 Jun  4  2009 cifar-10-batches-py
-rw-r--r-- 1 train108 gue998 163M Jun  4  2009 cifar-10-python.tar.gz
lrwxrwxrwx 1 train108 gue998   32 Aug  6 14:45 data -> /cm/shared/examples/sdsc/si/2023
[train108@login02 ~]$
```

What type of files are these? Let's check the [CIFAR-10](https://www.cs.toronto.edu/~kriz/cifar.html) website again. See [Pickle](https://en.wikipedia.org/wiki/Serialization#Pickle). 

*Command:*
```
ls -lh cifar-10-batches-py/
```

*Output:*
```
[train108@login02 ~]$ ls -lh cifar-10-batches-py/
total 177M
-rw-r--r-- 1 train108 gue998 158 Mar 30  2009 batches.meta
-rw-r--r-- 1 train108 gue998 30M Mar 30  2009 data_batch_1
-rw-r--r-- 1 train108 gue998 30M Mar 30  2009 data_batch_2
-rw-r--r-- 1 train108 gue998 30M Mar 30  2009 data_batch_3
-rw-r--r-- 1 train108 gue998 30M Mar 30  2009 data_batch_4
-rw-r--r-- 1 train108 gue998 30M Mar 30  2009 data_batch_5
-rw-r--r-- 1 train108 gue998  88 Jun  4  2009 readme.html
-rw-r--r-- 1 train108 gue998 30M Mar 30  2009 test_batch
[train108@login02 ~]$
```


 How do we know the data we've downloaded from the internet is correct? How do we prove we all have the same data? Hash it. Let's start with the traditional [`md5sum`](https://en.wikipedia.org/wiki/Md5sum) command-line program. 

 *Command:*

```
md5sum cifar-10-python.tar.gz
```

*Output:*
```
[train108@login02 ~]$ md5sum cifar-10-python.tar.gz
c58f30108f718f92721af3b95e74349a  cifar-10-python.tar.gz
[train108@login02 ~]$
```

```
md5sum cifar-10-python.tar.gz > cifar-10-python.md5
```

```
[xdtr@login02 ~]$ ls -lh
total 163M
drwxr-xr-x 2 xdtr abc123   10 Jun  4  2009 cifar-10-batches-py
-rw-r--r-- 1 xdtr abc123   57 Jul 26 08:53 cifar-10-python.md5
-rw-r--r-- 1 xdtr abc123 163M Jun  4  2009 cifar-10-python.tar.gz
```

```
[xdtr@login02 ~]$ md5sum -c cifar-10-python.md5 
cifar-10-python.tar.gz: OK
```

```
curl https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz -o cifar-10-python.tgz
```

```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  162M  100  162M    0     0  28.1M      0  0:00:05  0:00:05 --:--:-- 33.3M
```

```
[xdtr@login02 ~]$ ls -lh
total 326M
drwxr-xr-x 2 xdtr abc123   10 Jun  4  2009 cifar-10-batches-py
-rw-r--r-- 1 xdtr abc123   57 Jul 26 08:53 cifar-10-python.md5
-rw-r--r-- 1 xdtr abc123 163M Jun  4  2009 cifar-10-python.tar.gz
-rw-r--r-- 1 xdtr abc123 163M Jul 26 08:54 cifar-10-python.tgz
```

```
wget https://raw.githubusercontent.com/sdsc/sdsc-summer-institute-2022/main/2.5_data_management/cifar-10-python.sha256
```

```
[xdtr@login02 ~]$ sha256sum -c cifar-10-python.sha256 
cifar-10-python.tgz: OK
```

#

[Back to Top of Page](#top)

[Back to Main Page](../README.md)

Next - [More files, more problems: Advantages and limitations of different filesystems](FILESYSTEMS.md)

