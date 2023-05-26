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
