__          _______    _____ _____            _____ _  __  _   _ _____ _____
/\ \        / / ____|  / ____|  __ \     /\   / ____| |/ / | \ | |_   _|  __ \
/  \ \  /\  / / (___   | |    | |__) |   /  \ | |    | ' /  |  \| | | | | |__) |
/ /\ \ \/  \/ / \___ \  | |    |  _  /   / /\ \| |    |  <   | . ` | | | |  ___/
/ ____ \  /\  /  ____) | | |____| | \ \  / ____ \ |____| . \  | |\  |_| |_| |
/_/    \_\/  \/  |_____/   \_____|_|  \_\/_/    \_\_____|_|\_\ |_| \_|_____|_|
| |
| |__  _   _
| '_ \| | | |
| |_) | |_| |
|_.__/ \__, |
   __/ |
_____ |___/_   ____ _______ _____       _______
|  __ \ / __ \ / __ \__   __/ ____|   /\|__   __|
| |__) | |  | | |  | | | | | |       /  \  | |
|  _  /| |  | | |  | | | | | |      / /\ \ | |
| | \ \| |__| | |__| | | | | |____ / ____ \| |
|_|  \_\\____/ \____/  |_|  \_____/_/    \_\_|




# What is this?

A simplistic, minimalist deployment script and template to create a cracking ready ec2 instance.
Awscracknip deploys an ec2 instance with a security group ready to connect and deploys all that is needed to run hashcat and make use of NVIDIA Teslas.


Instances like g3s.xlarge nvidia tesla

# Why tho?
There a already fancy aws based crackers out there, like e.g. https://github.com/c6fc/npk and other great ones.
They work and are great but I could never fit them in my daily workflow.

there are others like this but setup to complex to make own adjustments
setup to much of a hassle to setup
Problem: Connect to wordlists

# What do I need?
You need:
* An AWS account with sufficent service quote to deploy ec2 Instances
* A keypair to connect via SSH
* aws cli installed on your machine where awscracknip is deployed

You might want:
* A efs or ebs share where you store your wordlists

The efs-utils is installed on the deployed instance.

# How does it work
Awscracknip installs everything with cloudformation. The default stack that gets deployed needs your SSH KeyName and the EC2-Instance, which gets deployed. By default an g3s.xlarge
is selected if none is given.
bash awscracknip.sh -install KeyName

The stack can be killed and the EC2Instance and its SecurityGroup deleted via
bash awscracknip.sh -kill

In order to connect to the instance, use
bash awscracknip.sh -connect

To not accumalte costs you can keep it running but suspend the EC2 via
bash awscracknip.sh -stop
and -start to wake it up again.

-connect assumes the key to be in the same folder as the deployment script, you can either change this in the script or connect however else you like.

# What will this cost me?
Depends on your used storage and your ec2 instance plus runtime. Can check it here
https://instances.vantage.sh/


the output of aws cli is intentionally shown to make it easier to troubleshoot
while stack deployment is fast the scripts to make it ready to run hascat and the installation of the requisites take a while
