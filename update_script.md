# Update Script
The latest changes to my plan is that I want to make an update file to keep it
updated for any users.
This should however only a script that fetches the actual update file from the
internet at some specified directory, i.e. in my github repository.
It should fetch that through wget or curl and then execute it.

However it should also always check the gnome version because somehow I should
enable someone to use the script and keep the script constant without breaking
it by forcing newer software on it.

Further, I will have to set it up so that it can be run as a cronjob and maybe,
that is what an initial script can do, download a script that will stay constant
and be run by a cronjob.
Which will run the update script periodically, but only update if the gnome
version is compatible with the update.
