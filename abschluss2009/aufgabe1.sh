#!/bin/bash
# als root ausfuehren

groupadd eink
groupadd buch
groupadd verk
groupadd leit

useradd -m -g eink -s /bin/bash -p `openssl passwd anna` anna
useradd -m -g eink -s /bin/bash -p `openssl passwd egon` egon
useradd -m -g buch -s /bin/bash -p `openssl passwd udo` udo
useradd -m -g verk -s /bin/bash -p `openssl passwd willi` willi
useradd -m -g leit -s /bin/bash -p `openssl passwd otto` otto
useradd -m -g leit -s /bin/bash -p `openssl passwd inge` inge
gpasswd -a udo verk

# gruppen verz. gruppenmitglieder mit schreib rechten
# ohne acl realisiert
mkdir /home/eink
chgrp eink /home/eink
chmod 770 /home/eink
mkdir /home/buch
chgrp buch /home/buch
chmod 770 /home/buch
mkdir /home/verk
chgrp verk /home/verk
chmod 770 /home/verk
mkdir /home/leit
chgrp leit /home/leit
chmod 770 /home/leit
# mit acl
setfacl -m "g:eink:rwx" eink/
setfacl -m "g:buch:rwx" buch/
setfacl -m "g:verk:rwx" verk/
setfacl -m "g:leit:rwx" leit/

# private verz primaergruppenmitglieder haben leserechte
# ohne acl realisiert
chmod g+r /home/anna
chmod g+r /home/egon
chmod g+r /home/udo
chmod g+r /home/willi
chmod g+r /home/otto
chmod g+r /home/inge
# mit acl
setfacl -m "g:eink:rx" anna/
setfacl -m "g:eink:rx" egon/
setfacl -m "g:buch:rx" udp/
setfacl -m "g:verk:rx" udo/
setfacl -m "g:verk:rx" willi/
setfacl -m "g:leit:rx" otto/
setfacl -m "g:leit:rx" inge/
