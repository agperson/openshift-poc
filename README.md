openshift-poc
=============

Puppetmaster configuration for OpenShift Origin POC.  This repository can be used to stand up an OO environment in EC2.  It assumes:
1. Pre-created EC2 security group, PEM, and API key
2. Route 53 zone dedicated to OO.

Bootstrap a puppetmaster
------------------------
The Puppetmaster will manage the entire environment, including provisioning nodes, brokers, and support instances.

1. Create a new *m1.small* or larger instance running RHEL 6.4 or CentOS 6.4 (I use ami-52009e3b)
2. Log into the instance as the ec2-user
3. Place EC2 security PEM in ~root/.ssh
4. Place AWS credentials into ~root/.fog

        :default:
          :aws_access_key_id:     FOOBAR
          :aws_secret_access_key: FooBarFooBarFooBar
5. Add the Cloud Provisioner to root's RUBYLIB path:

        $ echo "export RUBYLIB=/etc/puppet/environments/master/modules/cloud_provisioner/lib:$RUBYLIB" >> ~/.bash_profile
6. Download and run the bootstrap script as root:

        $ wget https://raw.github.com/huit/openshift-poc/production/puppetmaster-bootstrap.sh
        $ chmod +x puppetmaster-bootstrap.sh
        $ sudo ./puppetmaster-bootstrap.sh
        
The script will install necessary dependencies and apply the "openshift::puppetmaster" profile from this repository.

Generating additional nodes
---------------------------
In progress.  Use the oo-create-instance script.
