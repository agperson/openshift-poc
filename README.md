openshift-poc
=============

Puppetmaster configuration for OpenShift Origin POC

To bootstrap a puppetmaster node:
* Create a new RHEL 6 or CentOS 6 AMI (I use ami-52009e3b) -- at least m1.small
* Log in and wget the puppetmaster-bootstrap.sh script
* Run it as root

The script will install necessary dependencies to apply the "openshift::puppetmaster" profile from this repository.
