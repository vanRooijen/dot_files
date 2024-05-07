# General TODO and Notes concerning the installation script and expansions

## Future of the project:
Currently there is an idea for a wider expansion of the script to be more than
just an installation script, but rather an entire system for managing dotfiles
in gnome.

I think this is a worthy thing of pursuing, but also a realistic thing to be
pursuing. The Gnome environment is something I can totally get behind because of
it's widely used and therefore an easy to use configuration tool might help
for a lot of people.

I think it is realistic to create an interface to show all the configurations
and themes that you have on your system, as well as back them up and be able to
convert back to the original state you were in.

## Current state of the script:
For the install script, I do not yet want to do any of that.

I simply want to get the state of everything that is on the computer at the
moment to possibly revert back to it later, further I want to make sure not to
overwrite any files that are already there.
Only add another type of theme if possible. Only reverting to what is was not a
whole management system for themes.

What this will entail, that complicates things is a directory to store
everything that is currently on the system, that would otherwise be overwritten.

## Immediate TODO:

First I want to note the latest changes to my idea and what it entails:

- I think I should not install any applications with an package manager, this is
hacky and not a very professional idea, If they want to install something they
can do it themselves.
- I think 

### Bash Configuration
- [ ] Redo the bash configuration, such that it does not include some of my
very personal things and things that might not be for others.
- [ ] Then add .bashrc to the .gitignore file

### IMPORTANT:
- [ ] I should make sure if the client runs this script 1000 times, it should
still work, for this reason, considering subdirectories with dates in the
state_restore directory might be a good idea.
- [ ] I should check for the clients Gnome version. I think this is crucial for
how gnome functions however I can probably check. If it is backwards compatible.
- [ ] Thinking more realistically about something that will be useful for me as
well is just creating a system that can quickly switch between different themes
and whole configurations. This will be very nice for me in general and it is
something that I now think is achievable.
However creating such a system that is a little more general will be difficult.

### Packaging:
The best most simple way to package this would be to put the entire dotfiles
directory in a tarball and then put that on github alongside the install
script. The install script can be installed and run with a single curl command.
- [ ] Think about how I might change my github to accommodate this. Like do I
create a new repository alongside this to install from?
- [ ] Rethink the entire idea above, because this will not work really well
with updates.
- [ ] Except I am thinking my original idea and I actually think it is actually
better for update and such. 
- [ ] Can I create a github release that packages everything as a tarbal


### Backup and Restore:
- [ ] Look into YAML for storing some information about the state of the system
- [ ] Look into what files I might want to store in the state_restore directory

- [x] Make a directory to store all the files that are currently on the system

# What I want to create
Thinking again about what I want to create, it is something simple and straight
to the point. Therefore I think I should definately leave out that part about
variety, however I could make a extra script specifically for that.

# Here follows the notes I made about it in my script. 

## Installing applications

TODO: What about giving options on what package manager to use for example
should it use apt or snap.
However the abstractions of installing can still be done for people that don't
know much about package managers.

BUT what about how they version of the distribution might affect the
installation script?

## Research for bigger project:

TODO: Importantly before I do all this though, I would have to check out
already existing things that might exist for example ansible, I don't know
what it is but I think it has something to do with this I have been talking
about, managing config files and such.

## Using C

TODO: I have again been thinking about using C and to some extent, I think it
might be a very good idea, not this project. I think I should just make the
script and get it done with, however I do think maybe I should make that
development system separately in C.
Or maybe create in C a system that can enable, disable, revert, update, backup
and generally just manage dotfiles in a safe way.

### Questions about the Users:

Who am I making this for?
At the moment I have 3 distinct ideas that are all for different target
audiences:

1. The first idea being an easy way to install dotfiles and understand what each
part of the installation is adding to your setup.
2. The second idea is to create a system that backs up your entire gnome
environment. This is a bit of a more convoluted idea, however something I think
has a lot of potential. Especially for expansion.
3. The third idea is to just create something that you add onto the default
gnome experience. This is something you install with a single command to make
the gnome environment a lot better when you first install it. Something
applicable to a wider audience and therefore something universally liked.

4. Idea 4 is just a simple system to update my current dotfiles and backup, come
to think of it that should be build into the normal bigger idea too, however I
add this option to replace option 2, if I never end up doing it. 

