# -*- coding: utf-8 -*-
root_dir = File.expand_path('../', File.dirname(__FILE__))

log_level :info
log_location STDOUT
node_name 'pentester'
client_key "#{root_dir}/secrets/pentester.pem"
chef_server_url 'https://your-chef-server/organizations/pentestlab'

cache_type 'BasicFile'
file_cache_path "#{root_dir}/cache"
trusted_certs_dir "#{root_dir}/.chef/trusted_certs"
cookbook_path ["#{root_dir}/cookbooks"]
role_path "#{root_dir}/roles"
node_path "#{ENV['PWD']}/nodes"

driver 'fog:OpenStack'
driver_options :compute_options => {
                 openstack_username: ENV['OS_USERNAME'],
                 openstack_api_key: ENV['OS_PASSWORD'],
                 openstack_auth_url: "#{ENV['OS_AUTH_URL']}/tokens",
                 openstack_tenant: ENV['OS_TENANT_NAME']
               }

machine_options bootstrap_options: {
                  image_ref: 'debian-8-uuid',
                  flavor_ref: 'flavor-uuid',
                  key_name: 'pentester',
                  security_groups: ['default'],
                  nics: [{net_id: 'lab-network-uuid'}],
                  sudo: true,
                  is_windows: false },
                convergence_options:
                  { chef_version: '12.15.19' },
                ssh_username: 'debian',
                transport_address_location: :private_ip
