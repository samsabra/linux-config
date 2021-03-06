#! /bin/bash
# dunno, something with grep, maybe killing some errors?
unset GREP_OPTIONS

# where are the dist files (source code of installed software)
export DISTDIR='/usr/portage/distfiles'

#temnial collors
# export TERM='konsole-256color'
export TERM='screen-256color'

# stuff on JVM
export GRAILS_HOME='/usr/local/lib/grails-core'
export SCALA_HOME='/usr/local/lib/scala'
export ANDROID_HOME=$HOME"/android"
export PATH=${PATH}:${GRAILS_HOME}'/bin'
export PATH=${PATH}:$HOME'/Projects/bash-simple-ci/bin'
export PATH=${PATH}:${SCALA_HOME}'/bin'
export PATH=${PATH}:$HOME'/programs/bin' # programs that aren't installed trough potrage
export PATH=${PATH}:$HOME'/.local/bin'
export PATH=${PATH}:$HOME'/.yarn/bin'
export PATH=${PATH}:$HOME'/google-cloud-sdk/bin'
export PATH=${PATH}:${ANDROID_HOME}'/tools'
export PATH=${PATH}:${ANDROID_HOME}'/platform-tools'
export JAVA_OPTS="-Xms1024m -Xmx4048m -XX:MaxPermSize=512m";

# javascript packages in path
export PATH=${PATH}:$HOME'/node_modules/.bin'

export TERMCMD='gnome-terminal'

export CCACHE_COMPRESS=1

export KEYSTORE="$HOME/.android/debug.keystore"
export KEYSTORE_PASSWORD="android"
export KEY_ALIAS="androiddebugkey"
export KEY_PASSWORD="android"
export SCALA_STDLIB=$SCALA_HOME/lib/scala-library.jar

export PATH=$PATH:/opt/usertools/jappie/bin

#rust
export PATH=$PATH:~/Projects/racer/target/release
#export RUST_SRC_PATH=$DISTDIR/rustc-$(eselect rust list | grep \* | sed 's/.*-//' | sed 's/ \*$//')-src.tar.gz
#export PATH=$PATH:$HOME/.cargo/bin

#firefox hardware acceleration
export MOZ_USE_OMTC=1

# we want qt to look like the kde theme
export XDG_CURRENT_DESKTOP=kde
export QT_STYLE_OVERRIDE=GTK+
# export QT_QPA_PLATFORMTHEME="qt5ct"

export LS_COLORS='di=0;35'

# crappy jump around mechanism
export LINUX_CONFIG="/usr/local/src/linux-config/"
export DOT_FILES="$LINUX_CONFIG/dotfiles/jappie"

# Prevent Wine from adding menu entries and desktop links.
export WINEDLLOVERRIDES='winemenubuilder.exe=d'

# random cowsay in ansible
export ANSIBLE_COW_SELECTION=random

#nix (not neccisary for nixos)
# source /home/jappie/.nix-profile/etc/profile.d/nix.sh

