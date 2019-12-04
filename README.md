# haskell-web-stack-aws-init
base environment to do haskell tutorial https://gitlab.com/williamyaoh/haskell-web-stack

# setup and run the example haskell stack
I picked this ami `Amazon Linux 2 AMI 2.0.20191116.0 x86_64 HVM gp2` when launching the instance

spin up a t2.medium (or similar instance type), a t2.small only has 2GB of memory and that doesn't seem to be enough to run everything.

```
ssh ec2-user@aws-instance-ip

sudo yum install git

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
