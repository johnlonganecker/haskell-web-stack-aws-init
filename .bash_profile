# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

# haskell addition
PATH=$PATH:/home/ec2-user/node/bin:/home/ec2-user/stack

export PATH
