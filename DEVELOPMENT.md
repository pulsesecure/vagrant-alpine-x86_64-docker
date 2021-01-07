Development
===========

Notes for developers.


Building
--------

##alpine 3.3.3

Get token from [Atlas](https://atlas.hashicorp.com/settings/tokens)

    export ATLAS_TOKEN=<token>

Build:
    cd alpine/alpine3.3.3
    ./build.sh


Push:

    cd packer
    packer build template.json -var 'ATLAS_TOKEN=<token>'

##alpine 3.12.1


Get token from [vagrant](https://app.vagrantup.com/settings/security)


Build:
    cd alpine/alpine3.12.1
    ./build.sh -var 'ATLAS_TOKEN=<token>'


Push:

    cd packer
    packer build template.json -var 'ATLAS_TOKEN=<token>'
