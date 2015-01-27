#!/bin/sh

# eu-west-1 ami-4ac6653d is CentOS 6 x86_64 (2014_09_29) EBS PV-1
# us-east-1 ami-bc8131d4 is CentOS 6 x86_64 (2014_09_29) EBS PV-1
# eu-west-1 ami-a9d105de is CentOS 7 x86_64 (2014_09_29) EBS HVM
# us-east-1 ami-96a818fe is CentOS 7 x86_64 (2014_09_29) EBS HVM
# us-east-1 ami-7e064216 is private CentOS 7 x86_64 EBS HVM with 2GB swap, root ssh login enabled, and updates as of 2015-01-27

exec knife ec2 server create \
  --region us-east-1 -I ami-7e064216 -f m3.medium \
  -s subnet-557b087d --associate-public-ip \
  --server-url https://chef.r53.acp.io:443 -N oratest3 -r 'role[oracle_xe]'

# exec knife ec2 server create \
#   --region eu-west-1 -I ami-a9d105de -f m3.medium --ephemeral /dev/sdb \
#   -s subnet-977f41e3 --associate-public-ip \
#   --user-data $(dirname "$0")/oracle-11g-xe-cloud-config.yml \
#   --server-url https://chef.r53.acp.io:443 -N oratest2 -r 'role[oracle_xe]'
