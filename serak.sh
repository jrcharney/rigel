#!/bin/bash
# File: get_software.sh
#	"HOW TO COOK           HUMANS"
#       "HOW TO COOK     for   HUMANS"
#       "HOW TO COOK     forty HUMANS"
#	"HOW TO COOK for forty HUMANS" by Serak the Preparer
# Info: On the computer/hardrive/SD card you are not the one you are going to install Kodos on, 
# 		but are capable of downloading, quickly cross-compiling and assembling a working image,
#		use this script to download all the stuff we need.
#		The next script will arrange the pieces together.
# Software requirements: The constructing computer will need curl, wget, tar, git, and a few other things.

# NOTE: .tar.gz files are larger than .tar.bz2 and .tar.xz files, but in the case of uniformity, 
#		using packages of the same file extension helps make this script work better.

# TODO: Check if a specific software exist to download and install stuff.

# TODO: Get a list of most up-to-date urls
# TODO: Don't extract URLs that use the git protocol or have a .git suffix.
#		In fact, more than likely, anything from github.com will not be extracted.
# Sites with a lot of packages:
# http://ftp.gnome.org/pub/gnome/sources/
# https://download.gnome.org/sources/
# http://ftp.gnu.org/gnu/
# http://ftp.openbsd.org/pub/OpenBSD/
# http://cgit.freedesktop.org/xorg/
# http://www.freedesktop.org/software/
# https://pypi.python.org/pypi/ (For Python)
# http://download.gimp.org/pub/ (For GIMP)
# http://www.x.org/releases/X11R7.7/src/everything/
# http://www.x.org/releases/individual/ (more bleeding edge stuff for X.Org. Use at your own risk!)
# SECURITY NOTICE: Check http://www.x.org/wiki/Development/Security/ for security patches reguarding X.Org
# DO NOT INCLUDE http://freecode.com/ links. The Freecode guys aren't updating anymore.
# DO NOT INCLUDE http://freshmeat.net/ either.

# TODO: Test URL sites. Do not extract if from github.com or if the URL was a .git file.
# TODO: If a site is from sourceforge, make sure that curl saves it as the file it should be downloading.
#		In other words, you can remove that trailing "/download" part. Curl should redirect thanks to -L.
#		So this TODO point is solved.  Unless it needs that "prodownloads" part. Nope. Not really. We're good!
# TODO: Odroid supports OpenGL. Don't be afraid to look up Mesa packages.
# TODO: If there is some libSDL stuff missing, try going back and downloading the historic package as well.

# Func: extraction
# Info: execute extraction instructions based on various url extensions
extraction(){
 url=$1
 pkg=${url##*/}					# Strip out the URL
 tpkg=${pkg,,}					# Lowercase the package string for testing
 fix=${pkg##*.}					# everything after the last period
 dir=${pkg%.*}					# everything before the last period
 
 case ${tpkg##*.} in			# Test based on everything after the last period
  tgz)		extract="tar xz" ;;
  tbz|tbz2)	extract="tar xj" ;;
  gz|bz|bz2|xz)
  	if [[ ${dir,,} =~ \.tar$ ]]; then
  	 fix="${dir##*.}.${fix}"
  	 dir="${dir%.*}"
  	 case ${tpkg##*.} in
  	  gz)		extract="tar xz" ;;
  	  bz|bz2)	extract="tar xj" ;;
  	  xz)		extract="tar xJ" ;;
  	 esac
  	else
  	 case ${tpkg##*.} in
  	  gz)		extract="gunzip" ;;
  	  bz|bz2)	extract="bunzip2" ;;
  	  xz)		extract="unxz" ;;
  	 esac
  	fi
  	;;
  tar)		extract="tar x" ;;
  cpio)		;;		# look into this
  shar)		;;		# look into this
  rar)		;;		# look into this. It might just be a simple "unrar"
  zip)		extract="unzip" ;;
  git)	 ;;			# Do nothing, for now.	# TODO: Better yet, let's not extract that type here.
  *)	;;			# Do nothing
 esac
 echo "${extract}"
}

# Func: download
# Info: Download instructions based on protocol and website, some sites may have extraction
download(){
 url=$1
 # Download instructions will need to vary depending on the protocol used to fetch software.
 case "${url%%://*}" in		# protocol only
  http|https|ftp)
   # TODO: While we test package file extensions for the most part using the extraction() method, 
   #	tests for git repos and .git files should be done here.
   # Don't use -O in curl when piping to an extraction command.
   # TODO: Test for various URLs here that use git or Mercurial.
   # git will need to be used for github URLs
   # hg will need to be used for bitbucket URLs
   fix="${url,,}"			# lowercase the url string just in case
   case "${fix##*.}" in
    git) git clone "${url}" ;;			# Clone git projects
    *)
      # MAJOR TODO: Extract the base URL to be used here for sites like github and bitbucket
      noproto=${url##*://}		# remove the protocol
      domain=${noproto%%/*}
      domainname=${domain%%:*}		# remove the port
      site=${domainname#*.}
      tld=${domainname##*.}
      [[ $site == $tld ]] && site=$domainname
      case "${site}" in
      "github.com")    git clone "${url}"
      "bitbucket.com") hg clone "${url}"		# TODO: hopefully I do not need to ad another argument to create a directory
      *) curl -SL "${url}" | $(extraction "${url}") ;;
   esac ;;
  git)	git clone $url ;;	# TODO: This might not work for all git
  #file)	;;	# Maybe later. Use it as a hack to extract locally
  *)	;;	# For now, do nothing. An error will likely need to be thrown later.
 esac
}

# TODO: Find some way to load a list of URLs from an external bash array
for url in "${urls[@]}"; do
 download $url
done


# Making projects from source
# The standard recipe for making a project from source is generally
#	./configure && make && sudo make install
# I like to add an extra step
#	./configure && make && sudo make install && sudo ldconfig
# For most CMake made projects, you need to create a build directory first
#   mkdir build && cd build
#   cmake .. && make && sudo make install
# As per my preference, I like to run `sudo ldconfig` after the make install.
# For Linux From Scratch distros, adminstrators have to option to put change the path to /usr/bin.
# Some times, people will install experimental software in the /opt/ directory so they can delete everything related to it.  This is ideal for a couple of items.
# Users do have the option of changing the prefix of the install using "-DPREFIX" (shorthand of "-D -PREFIX") or "-PREFIX" or something like that. YMMV.
# And then there are the changes to the ~/.bashrc file (or some other file like it.) But we'll talk about that later.

