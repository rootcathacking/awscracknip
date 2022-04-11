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




What is this?

A simplistic, minimalist deployment script and template to create a cracking ready ec2 instance.




Instances like g3s.xlarge nvidia tesla

Why tho?
there are others like this but setup to complex to make own adjustments
setup to much of a hassle to setup
Problem: Connect to wordlists

How does it work?
You need
MINAMILST setup
An AWS account
a KeyPair
aws cli installed

Nutzer brauche account und müssen ihre keys in config hinterlegen
Nutzer müssen contingent erhöhen
Key bereitstellen
ggf selber daten in ein eks laden
dann nur script install und connect, fertig

the output of aws cli is intentionally shown to make it easier to troubleshoot
while stack deployment is fast the scripts to make it ready to run hascat and the installation of the requisites take a while

can check costs here
https://instances.vantage.sh/
