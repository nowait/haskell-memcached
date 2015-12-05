
from sjfloat/haskell_7.10.2

user root
run apt-get update && apt-get install -y telnet

# TODO cleanup!

workdir /home/dev/work

user $USER

cmd $SHELL -l
