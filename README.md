```
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
```



# What is this?

A simplistic, minimalist deployment script and template to create a cracking ready EC2 instance.
Awscracknip deploys an EC2 instance with a security group, ready to connect and deploys all that is needed to run hashcat and make use of NVIDIA Teslas.


# Why tho?
There a already fancy aws based crackers out there, like e.g. https://github.com/c6fc/npk and other great ones.
They work and are very sophisticated, but I could never fit them in my daily workflow, due to high complexity or long setup times.

This is why awscracknip is kept very basic intentionally so on the fly changes on the template or deployment can be made without the need to spend a day  understanding complex code.

It can also be deployed and is ready within ~5 minutes. 

As a good wordlist is key to cracking. I have mine in an EFS storage, which can be mounted from anywhere to add stuff to it. Awscracknip comes with all the tools to connect and mount such a storage. It does not deploy any kind of storage so one can make it fit to an existing wordlist storage solution or aws setup.


# What do I need?
You need:
* An AWS account with sufficent service quota to deploy EC2 instances
* A keypair to connect via SSH
* aws cli installed on your machine where awscracknip is deployed

You might want:
* A EFS or EBS share where you store your wordlists

The efs-utils is installed on the deployed instance so mounting can be done.

# How does it work
Awscracknip installs everything with cloudformation. The default stack that gets deployed needs your SSH KeyName and the EC2 instance, which gets deployed. By default a g4dn.xlarge is selected if none is given. The output from aws cli is shown to make it easier to troubleshoot.

```
bash awscracknip.sh -install KeyName EC2Instance
```
While stack deployment is fast the scripts to make it ready to run hascat and install the drivers take a few minutes to finish.


The stack can be killed and the EC2 instance and its security group is deleted via
```
bash awscracknip.sh -kill
```
In order to connect to the instance, use
```
bash awscracknip.sh -connect
```

To not acccumulate unnessary costs you can keep it running but suspend the EC2 via
```
bash awscracknip.sh -stop
```
and -start to wake it up again.

-connect assumes the key to be in the same folder as the deployment script, you can either change this in the script or connect however else you like.

# What will this cost me?
Depends on your used storage and your EC2 instance plus runtime. A good place to check beforehand ist 
https://instances.vantage.sh/

For the default instance (g4dn.xlarge) and without storage costs, one can expect roughly 0,8$ or 0,75€ per running hour. With the p3 instances this can go up to 20-25$ per hour. However these instances are very very powerfull. At this point this is basically pay2win. 


