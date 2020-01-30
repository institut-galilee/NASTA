![](https://user-images.githubusercontent.com/56651736/72690478-1293fc00-3b1d-11ea-855e-099b8d1767c8.png)

# **MyP13 Project**

## Promotional video :
Coming soon ! Patience ! 

## Members :

* Nassim MESSAOUDI (nassim.messaoudi@edu.univ-paris13.fr) [NassimMS](https://github.com/msnassim "msnassim")
* Tarek NAIT SAADA (tarek.naitsaada@edu.univ-paris13.fr) [TarekNS](https://github.com/nstarek "nstarek")
* Marc JEAN PIERRE (marc.jean-pierre@edu.univ-paris13.fr) [MarcJP](https://github.com/marcjeanpierre "marcjeanpierre")

## Product's name : MyP13

## What's MyP13 ?

It's an IoT object/application which tries to centralize all services proposed by the university, for example access to the class planning, information provided on the university's website and many other usefull services. 
All this, by only putting your student card on the RFID scanner. 

## How does it work ?

When you put your student card on the RFID Reader, the application connects to the remote OpenLDAP server and checks if you're indeed in the database by performing an "ldapsearch". Once you've been successfully identified, you'll be able to access your class planning, the university plan and other services. You'll also be able to view the number of available computers in the classrooms in realtime.

## Future enhancements

* Add Active Directory support
* Code Hardening 

## Technicalities :

### OpenLDAP :

Deployed in a Docker container for portability and ease of use. We used [mwaeckerlin/openldap](https://hub.docker.com/r/mwaeckerlin/openldap).

### The application's GUI : Qt5

The graphical interface was entirely built with Qt creator and deployed on a ARM64 device (Raspberry pi 3B+).

### Backend :

Information gathering was generaly done using python. Then retrieved information is stored in sqlite databases, then processed and displayed in the Qapplication.
 
## Components :

* Raspberry Pi 3 B+
* 1x Power supply (Raspberry)
* HDMI cable for the touchscreen
* Plexiglass for the box
* Touchscreen display 7"


© 2020 Nassim MESSAOUDI - Tarek NAIT SAADA - Marc JEAN PIERRE. All rights reserved.
