# SYSAD, TASK 1

**Mode:** ??SuperUser??

## Prerequisites

GNU Mailutils must be installed.

`sudo` must be installed.

The filesystem (and kernel) must support POSIX ACLs. The `getfacl` and `setfacl` utilities must be installed. (eg. through the package `acl` on Debian)

## Installation

Clone the repo, and run
```
make
```
This will install to `/bin` by default. To install to (for example) `/usr/local/bin`:
```
PREFIX=/usr/local make
```

## Uninstall

```
make uninstall
```

## Setup

Clone this repo in a clean Unix environment. It may be helpful to create a Docker image or chroot directory for this purpose.
