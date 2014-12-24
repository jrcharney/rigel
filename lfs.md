LFS
=====
Linux From Scratch

## About this document
This page is just a bunch of notes I'm taking following  [Linux from Scratch](http://www.linuxfromscratch.org/lfs/) (LFS), which Rigel and by proxy Kang and Kodos, is based on.

There are some pretty obvoius things that are definutely going to be part of Rigel

* The Linux Kernel
* The GNU Compiler Collection (GCC)
* Python 2 (anything 3 is not ready yet)
* Perl
* Bash
* sed
* gawk
* X.org
* GTK+
* Fluxbox
* Fluxstyle
* Vim (with [spf13](http://vim.spf13.com/) installed)
* rxvt-unicode
* tmux
* OpenSSL
* OpenSSH

Were'd also going to need to do some cross-compling and it will need to be done on a Desktop though I think I can cheat by SSHing to my 64-bit desktop, then from SSH work on it on my hacktop remotely.  (Another thing to learn, especially since I should probably get a NAS if I want to do this outside of the house.

The version of LFS we plan on using to READ about first is LFS v7.6-systemd.  Slackware doesn't use Systemd yet, though Patrick Volkerding has contemplated using it.  Debian Wheezy does not have it.  Debian Jessie does but it's a train wreck on ODroid U3.  But I like it.

```bash
curl -SL http://www.freedesktop.org/software/systemd/systemd-218.tar.xz | tar xJv
```

Since we're going to be using `curl`, `tar`, `gunzip`, `bunzip2` `unxz`, and `unzip` quite frequently, I  have a script made for this task called `serak`.

```bash
./serak http://www.freedesktop.org/software/systemd/systemd-218.tar.xz
```
