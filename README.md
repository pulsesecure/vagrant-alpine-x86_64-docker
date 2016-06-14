vagrant-alpine-3.3-x86_64-docker
================================

Vagrant Box for Alpine 3.3 with Docker

Includes:

- Basic [Vagrant](https://www.vagrantup.com/) user setup 
- [Docker](https://www.docker.com/)
- [Chrony](https://chrony.tuxfamily.org/) for NTP with settings for VM sleep
- 50 GB sparse disk for all your Docker images


Usage
-----

You will need [vagrant-alpine](https://github.com/maier/vagrant-alpine) plugin
to make full use of this Vagrant box:

    vagrant plugin install vagrant-alpine

Create a [VirtualBox](https://www.virtualbox.org/wiki/Downloads) VM 
with [Vagrant](https://www.vagrantup.com/):

    vagrant init pulsesecure/alpine-3.3-x86_64-docker
    vagrant up --provider virtualbox
    vagrant ssh
