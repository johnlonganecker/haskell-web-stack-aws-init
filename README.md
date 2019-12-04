# haskell-web-stack-aws-init
base environment to do haskell tutorial https://gitlab.com/williamyaoh/haskell-web-stack

# setup and run the example haskell stack
spin up a t2.small (or similar instance type), a t2.micro only has 1GB of memory and that doesn't seem to be enough to run everything.

```
ssh user@aws-instance-ip

# install git

git clone https://github.com/johnlonganecker/haskell-web-stack-aws-init.git

cd haskell-web-stack-aws-init
./aws-init
```

That should setup everything up and start running the example haskell app

# run after installing
```
cd ~/haskell-web-stack
make run
```
