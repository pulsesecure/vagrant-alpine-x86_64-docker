Development
===========

Notes for developers.


Building
--------

Get token from [Atlas](https://atlas.hashicorp.com/settings/tokens)

    export ATLAS_TOKEN=<token>
    
Build:
    
    ./build.sh


Push:

    cd packer
    packer build template.json
