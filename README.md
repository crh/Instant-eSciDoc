# Instant eSciDoc

## What is it for ?
This repository consists of a set of templates for creating a fully automated installation of the [eSciDoc core framework](https://www.escidoc.org) in a virtual machine.

It uses the Chef infrastructure automation tool and Vagrant, a tool for managing local virtual machines.

All that is needed is an empty Linux virtual machine. Chef and Vagrant will do the rest. You execute a single command and get a complete, running eSciDoc installation.

## Installation instructions
First, install [Vagrant](http://vagrantup.com) and [Virtual Box](https://www.virtualbox.org/) (also install the Virtual Box SDK tools).
Instructions for installing Vagrant can be found [here](http://vagrantup.com/docs/getting-started/index.html). 

Now you need a base box to get started. A base box is a bare bones installation of a Linux system. The templates were developed with ubuntu 11.x 64. I recommend you to use this flavor and version too. 

You can add an Ubuntu box with the following command:  

    vagrant box add ubuntu-1110-server-amd64 http://timhuegdon.com/vagrant-boxes/ubuntu-11.10.box 

This pulls the box from the provided URL.
    
_Note:_ This box is listed on the Vagrantbox.es [site](http://vagrantbox.es/). In case you need your own box you can easily create a custom box from scratch. There's a nice tool that automates most of this process: [Veewee](https://github.com/jedi4ever/veewee)   

Once the download is complete, you should clone this repository. Now change the working directory to where you cloned the repo to and open the Vagrantfile. This file contains most of the configuration options and is needed by Vagrant. Set all passwords and user names as you need. 

Then open the file cookbooks/escidoc/attributes/default.rb. This file contains the installer options. You can modify these if you need to. 

Now it's time to actually install the VM. You can do this with:

    vagrant up

This should take a couple of minutes and leave you with a running eSciDoc instance. 

You can then connect to eSciDoc by opening http://localhost:8080. The eSciDoc start page should show.

You can also ssh into your new virtual machine with

    vagrant ssh 

The installer creates a service that you can conveniently use for starting and stopping eSciDoc:

    /etc/init.d/escidoc [start|stop]

Once you are done with the VM, you can either delete it with `vagrant destroy` or just halt it with `vagrant halt / suspend` and use it again later.

Have Fun !
