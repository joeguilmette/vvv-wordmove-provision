#Provision VVV to include Wordmove

All files go in to VVV root. provision.sh from VVV will live alongside the included files in the provision/ folder.

##Issues

Currently, Photocopier will not take multiple rsync flags, so we'll use specific_install to grab the latest version from their GitHub repo. Hopefully soon we can rely on the gem and just install Wordmove, which will grab Photocopier as a dependency.
