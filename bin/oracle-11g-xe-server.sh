#!/bin/sh
# ami-4ac6653d is CentOS 6 x86_64 (2014_09_29) EBS PV-1
exec knife ec2 server create \
  --region eu-west-1 -I ami-4ac6653d -f m3.medium --ephemeral /dev/sdb \
  -s subnet-977f41e3 --associate-public-ip \
  --user-data oracle-11g-xe-cloud-config.yml \
  --server-url https://chef.r53.acp.io:443 -N oratest1 -r 'role[oracle_xe]'
