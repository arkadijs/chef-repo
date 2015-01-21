name "oracle_xe"
description "A role to install Oracle XE 11g R2"
run_list "recipe[oracle-11g-xe]"
default_attributes "oracle-11g-xe" => {"rpm_url" => "http://s3-eu-west-1.amazonaws.com/cloud-innovation/public/oracle-xe-11.2.0-1.0.x86_64.rpm" }
