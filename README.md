# SYSAD, TASK 1

**Mode:** Normal

## Prerequisites

`sudo` must be installed.

The filesystem (and kernel) must support POSIX ACLs. The `getfacl` and `setfacl` utilities must be installed. (eg. through the package `acl` on Debian)

GNU `make` must be installed.

## Installation

Clone the repo, and run
```
make
```
This will install to `/usr/local/bin`, and data files go in `/usr/share`. Building in a chroot is supported through the DESTDIR option.

.bashrc will be updated, and its current state will be saved.

## Uninstall

```
make uninstall
```

The saved .bashrc will be restored; you have to manually reconcile any differences between them due to changes made by you.

## Setup

Clone this repo in a clean Unix environment. It may be helpful to create a Docker image or chroot directory for this purpose.

## General Info

### Improvements

I have improved on the basic instructions in several instances -

- The use of a Makefile for installation, instead of a regular Bash script - 
    - allows for easier installation. 
    - By adding scripts to PATH, the aliases themselves can just call these scripts. The alternative would be to put all the code in every user's .bashrc, cluttering their configuration files with several hundred lines of code.
    - Automated uninstallation (`make uninstall`) is also possible.

- `fees.txt` is stored in its own directory for each student -
In order to fix this, the `fees.txt` is stored in a `fees` directory inside the home directory, which is owned by HAD and has no permissions for anyone else. The student is then givem read permission via ACL. This effectively prevents them from modifying `fees.txt`.
The script for `feeBreakup` is SUID HAD.

### Limitations

- The `mess.txt` file can be edited by anyone; this means that students can forge mess allocations. This cannot be mitigated without contradicting the given instructions.

- Bash cannot perform floating-point arithmetic. To avoid requiring another external utility for this purpose, the fee amounts are truncated to ints, sacrificing precision for simplicity.

- It is not possible to prevent students from forging transactions on `fees.txt`, with the current server layout.  If the `fees.txt` file for each student is placed directly inside their home directory, they can easily forge transactions by writing to the file, UNLESS the write-permissions for both the file AND the enclosing directory (their home directory) are removed. However, removing write permissions for the home directory will prevent the student from creating files/directories in their home directory! 
While in the current case it does not matter, since the transactions are basically meaningless, the fact remains that for a real implementation of transactions, the layout will have to be completely changed.
A potential solution, partially implemented here, is to put the `fees.txt` file in a seperate `fees` directory - owned by HAD and without write permissions - under each user's home directory. The `fee-breakup` executable would then need to be owned by HAD and have the SGID special permission set. This much has been implemented here; the problem is that the Linux kernel ignores the SUID and SGID bits on non-binary files (because of a historically large number of insecure scripts that were SUID root), meaning that the script cannot be run by the student user. For a working implementation, `fee-breakup` would have to be a binary file. A possible solution is to compile it to C source code via [shc](https://github.com/neurobin/shc), but this is beyond the scope of this task.
As such, write permission has been given to the `fees` directory.
