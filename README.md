rigel
=====

What Kang and Kodos have in common

## What is Rigel?
Rigel is a unified set of programs that all Linux distros use, especially ARM processor distributions like Kang and Kodos.

I want both Kang and Kodos to use the same tools for development, and I feel the Odroid guys may have missed the mark on that which is why I need to make Kang to make Kodos.  But there are things that both Linuxes will have in common but in order to find out, I need to do a lot of research and find things that everyone has come to a consensus is necesssary then look to see what in those tools can be done better to create a more enjoyable experience.

Kodos will have more features than Kang as Kodos is designed for Odroid Single board computers (SBCs), particularly the Odroid U3, and Kang for Raspberry Pi SBCs, particularly the Raspberry Pi B+.  The Odroid U3 has OpenGL support and can use MySQL among other things, thigs Raspberry Pis are not designed for.  It is certain Kodos will use my Plush project to set up scripts to make using a desktop environment better for programming, whereas Kang will need a lighter version of this since it's much easier to manipulate Rapsberry Pi from command line interfaces which start at startup.

However, Raspberry Pi has more standard tools and procedures for establishing a new distro.  That transparency is what makes Kang the more likely candidate to be developed first.  Americans also seem to find it a pain in the butt to set up their Raspberry Pi to use American keyboards as opposed to the Brittish settings that are preset in most Raspberry Pi.  If Americans find that annoying for thier own locale, imagine what it's like for the rest of the world who have taken an interest in ODroid?

Hopefully, Rigel can fix that and find the necessary internationalization tools to get things set up in such a way you only need to answer a few questions and not have to go back into the `root-utility.sh` script to fill out more questions you didn't know about.

One thing I suggest is picking a keyboard that enables the "Dead Keys" feature for tying international characters like á, é í,ó ú,  and ñ (pressing AltGr and a key), which if my computer was set up like that back then, I might not have failed a Spanish class by thinking about making a program that already exist that does these things.

## What's Rigel named after?
I know this is going to piss off the hardcore Trekkies, but Rigel is used instead of Rigel 7 (both of which turn out to be part of the *Star Trek* universe), as writing this README file is the first version.

Besides, Rigel System is parodied in the *Simpsons* universe as that is where Kang and Kodos come from.

## Why not Create a Debian Distro?
Rigel is prefered over Rigelian as that sounds like it is a Debian distro.  I'm hoping to avoid creating a Debian distro but at the same time be as functional as Debian.

## Why not Create a Slackware Distro?
From these components, I also hope to create a Source-Comping Package Management System called [Serak](http://simpsons.wikia.com/wiki/Serak_the_Preparer) (Not [Sarek](http://en.memory-alpha.org/wiki/Sarek).) which allow source packages to be used to create programs rather than binaries which rely on someone from Cannocal or Red Hat to update, which they don't do for all packages, and won't do immediately unless it affects their distribution.  [Slackware](http://www.slackware.com/) has something like this, and [they have an ARM distribution](http://arm.slackware.com/supportedplatforms/) but they don't explicitly say "This will work for Rapberry Pi" or "This will work for Odroid."  They do answer the question "Will it run on my device?". The answer: "Probably".

Slackware is good, but what I think Slack lacks is an explaination as to "Why is it so good?".  Rigel aims to be the base for Kang and Kodos and any other Linux distros and architectures to use with confidence.

Another thing Slackware is limited with it's tarball package tracking is from what I've read most everything is in a `.tgz` or `.tar.gz` form.  Serak won't limit itself to this format but be inclusive of other `.tar` formats including `.tar.bz2` and `.tar.xz`.

Slackware has yet to support `systemd`.  Rigil distros will support the use of `systemd`.
