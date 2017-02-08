# Pentest-lab | [![Build Status](https://travis-ci.org/Sliim/pentest-lab.svg?branch=master)](https://travis-ci.org/Sliim/pentest-lab) 

This repository contains examples to deploy a penetration testing lab on [OpenStack](https://www.openstack.org/) provisioned with [Heat](https://wiki.openstack.org/wiki/Heat), [Chef](https://chef.io/) and [Docker](https://docker.com/).  

It deploy an environment with some services ready to use to perform pentesting tasks collaboratively. It also provision target networks with vulnerables machines ready to pwn.  

![lab](https://raw.githubusercontent.com/Sliim/pentest-lab/master/docs/lab.png)

## Getting started
-  [Prepare the Chef Server](docs/chef-server.md)
-  [Provisioning the Lab](docs/provisioning.md)
-  [Setup target networks](docs/target.md)
-  [Available Services](docs/services.md)
-  [Setup Teamserver](docs/teamserver.md)
-  [Lab Machines](provisioning/machines/)

## Tools
-  [Butterfly setup](docs/butterfly.md)

## Contributing
1. Fork the repository on Github
2. Create a named feature branch (like `add-component-x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run `rake` command and ensure all tests pass
6. Submit a Pull Request using Github 

## License and Authors
Authors: Sliim <sliim@mailoo.org>

Contributors: [@gloutsch](https://github.com/gloutsch)

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

