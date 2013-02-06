# What is UNIX

* Kernel
* Shell
* Userland tools

# Types of UNIX

* Linux (GNU/Linux)
  * Debian/Ubuntu
  * Fedora
  * RHEL/Centos
  *
* Minix
* BSD
  * FreeBSD
  * NetBSD
  * OpenBSD
* Solaris

"Those who don't understand Unix are condemned to reinvent it, poorly." – Henry Spencer

Unix Philosophy: ***Write programs that do one thing and do it well. Write programs to work together. Write programs to handle text streams, because that is a universal interface.***

Why it matters:

type ```/bin/ls -al``` on the a mac and linux

* toolchain that is available
* kind of user commands and flags
* kind of filesystems
* core philosophy of the OS

# Types of files:


## Regular file

    % ls -dl /etc/passwd
    -rw-r--r-- 1 root wheel 5.0K May 30  2012 /etc/passwd

## Directory

    % ls -dl /usr
    drwxr-xr-x 11 root wheel 442 Aug 10 23:06 /usr/

## Symbolic link

    % ls -dl /etc/aliases
    lrwxr-xr-x 1 root wheel 15 Aug 10 14:05 /etc/aliases -> postfix/aliases

## Named pipe

    % sudo ls -al /var/spool/postfix/public/qmgr
    prw--w--w- 1 _postfix _postdrop 0 Aug 10 14:07 /var/spool/postfix/public/qmgr

## Socket

    % ls -dl /tmp/.s.PGSQL.5432
    srwxrwxrwx 1 ketanpadegaonkar wheel 0 Jan 31 22:43 /tmp/.s.PGSQL.5432=

## Device file

    % ls -ld /dev/tty /dev/disk0
    brw-r----- 1 root operator 1, 0 Jan 11 11:55 /dev/disk0
    crw-rw-rw- 1 root wheel    2, 0 Jan 23 10:52 /dev/tty

## Door

    solaris only

# Finding out more about about a file

## stat(1)

        % stat ~/.profile
          File: ‘/Users/ketanpadegaonkar/.profile’
          Size: 241                 Blocks: 8          IO Block: 4096   regular file
        Device: 1000002h/16777218d  Inode: 928692      Links: 1
        Access: (0644/-rw-r--r--)  Uid: (  501/ketanpadegaonkar)   Gid: (   20/   staff)
        Access: 2012-11-09 14:45:58.000000000 +0530
        Modify: 2012-03-05 16:42:11.000000000 +0530
        Change: 2012-05-31 08:35:04.000000000 +0530
         Birth: 2012-03-05 16:42:11.000000000 +0530

# Linux file system

    [ec2-user@ip-10-0-0-10 ~]$ ls -l /
    total 116
    dr-xr-xr-x  2 root root   4096 Oct 15 07:38 bin
    dr-xr-xr-x  4 root root   4096 Oct 15 06:18 boot
    drwxr-xr-x 15 root root   3360 Jan 22 07:54 dev
    drwxr-xr-x 88 root root   4096 Jan 26 03:21 etc
    drwxr-xr-x  3 root root   4096 Oct 15 06:24 home
    dr-xr-xr-x 10 root root   4096 Oct 15 06:09 lib
    dr-xr-xr-x  9 root root  12288 Oct 15 07:38 lib64
    drwxr-xr-x  2 root root   4096 Sep 23  2011 media
    drwxr-xr-x  2 root root   4096 Sep 23  2011 mnt
    drwxr-xr-x  5 root root   4096 Oct 15 07:01 opt
    dr-xr-xr-x 87 root root      0 Oct 17 06:41 proc
    dr-xr-x---  5 root root   4096 Oct 15 07:09 root
    dr-xr-xr-x  2 root root  12288 Oct 15 07:38 sbin
    drwxr-xr-x  2 root root   4096 Oct 15 07:00 selinux
    drwxr-xr-x  2 root root   4096 Sep 23  2011 srv
    drwxr-xr-x 13 root root      0 Oct 17 06:41 sys
    drwxrwxrwt  3 root root  20480 Feb  1 03:25 tmp
    drwxr-xr-x 13 root root   4096 Oct 15 05:57 usr
    drwxr-xr-x 21 root root   4096 Oct 15 07:06 var

## Everything is a file

"Everything is a file" describes one of the defining features of Unix, and its derivatives — that a wide range of input/output resources such as documents, directories, hard-drives, modems, keyboards, printers and even some inter-process and network communications are simple streams of bytes exposed through the filesystem name space.

    [ec2-user@ip-10-0-0-10 ~]$ cat /proc/cpuinfo
    processor       : 0
    vendor_id       : GenuineIntel
    cpu family      : 6
    model           : 44
    model name      : Intel(R) Xeon(R) CPU           E5645  @ 2.40GHz
    stepping        : 2
    cpu MHz         : 1999.975
    cache size      : 12288 KB
    fpu             : yes
    fpu_exception   : yes
    cpuid level     : 11
    wp              : yes
    flags           : fpu de tsc msr pae cx8 cmov pat clflush mmx fxsr sse sse2 ss ht syscall nx lm up rep_good unfair_spinlock pni pclmulqdq ssse3 cx16 sse4_1 sse4_2 popcnt aes hypervisor lahf_lm
    bogomips        : 3999.95
    clflush size    : 64
    cache_alignment : 64
    address sizes   : 40 bits physical, 48 bits virtual
    power management:


    [ec2-user@ip-10-0-0-10 ~]$ cat /proc/meminfo
    MemTotal:        1695376 kB
    MemFree:          242228 kB
    Buffers:          163280 kB
    Cached:           914116 kB
    SwapCached:            0 kB
    Active:           802248 kB
    Inactive:         369756 kB
    Active(anon):      14580 kB
    Inactive(anon):    80148 kB
    Active(file):     787668 kB
    Inactive(file):   289608 kB
    Unevictable:           0 kB


    [ec2-user@ip-10-0-0-10 ~]$ ls -l /dev
    total 0
    crw------- 1 root root      5,   1 Oct 17 06:41 console
    lrwxrwxrwx 1 root root          11 Oct 17 06:41 core -> /proc/kcore
    drwxr-xr-x 3 root root          80 Oct 17 06:41 cpu
    crw-rw---- 1 root root     10,  61 Oct 17 06:41 cpu_dma_latency
    crw-rw---- 1 root root     10,  62 Oct 17 06:41 crash
    drwxr-xr-x 4 root root          80 Oct 17 06:41 disk
    lrwxrwxrwx 1 root root           3 Oct 17 06:41 fb -> fb0
    crw-rw---- 1 root root     29,   0 Oct 17 06:41 fb0
    lrwxrwxrwx 1 root root          13 Oct 17 06:41 fd -> /proc/self/fd
    crw-rw-rw- 1 root root      1,   7 Oct 17 06:41 full
    crw-rw-rw- 1 root root     10, 229 Oct 17 06:41 fuse
    crw-rw---- 1 root lp        6,   0 Oct 17 06:41 lp0
    crw-rw---- 1 root lp        6,   1 Oct 17 06:41 lp1
    crw-rw---- 1 root lp        6,   2 Oct 17 06:41 lp2
    crw-rw---- 1 root lp        6,   3 Oct 17 06:41 lp3
    crw------- 1 root root    108,   0 Oct 17 06:41 ppp
    crw-rw-rw- 1 root root      1,   8 Oct 17 06:41 random
    lrwxrwxrwx 1 root root          15 Oct 17 06:41 stderr -> /proc/self/fd/2
    lrwxrwxrwx 1 root root          15 Oct 17 06:41 stdin -> /proc/self/fd/0
    lrwxrwxrwx 1 root root          15 Oct 17 06:41 stdout -> /proc/self/fd/1
    lrwxrwxrwx 1 root root           4 Oct 17 06:41 systty -> tty0
    crw-rw-rw- 1 root tty       5,   0 Oct 17 06:41 tty
    crw--w---- 1 root tty       4,   0 Oct 17 06:41 tty0
    crw------- 1 root root      4,   1 Oct 17 06:43 tty1
    crw------- 1 root root      4,   2 Oct 17 06:43 tty2
    crw-rw-rw- 1 root root      1,   9 Oct 17 06:41 urandom
    crw-rw---- 1 root root    251,   0 Oct 17 06:41 usbmon0
    brw-rw---- 1 root disk    202,  64 Oct 17 06:41 sda
    brw-rw---- 1 root disk    202,  65 Oct 17 06:41 sda1
    crw-rw-rw- 1 root root      1,   5 Oct 17 06:41 zero

# Man page

* what?

## Man page sections

    Section     Description
    1           General commands
    2           System calls
    3           Library functions, covering in particular the C standard library
    4           Special files (usually devices, those found in /dev) and drivers
    5           File formats and conventions
    6           Games and screensavers
    7           Miscellanea
    8           System administration commands and daemons

    $ man stat
    $ man 1 stat
    $ man 2 stat

    $ man -k/apropos [keyword]

# Basic file operations

* mv/cp/rm/cd/cat/head/tail

# Pipes and redirection:

    |           pipe
    <file       input redirection from file
    >file       output redirection to file
    2>/dev/null stderr redirection to file
    >>file      output append to file

# Searching through files

* less/grep/wc

# Searching for files

* Find files by name/wildcard/ignore case/
* find/locate

# Shell globbing

* /var/{log,run}/httpd*

