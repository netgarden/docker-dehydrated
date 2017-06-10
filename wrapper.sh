#!/bin/bash

dehydrated="/opt/dehydrated/app/dehydrated"

src_config="/opt/dehydrated/app/docs/examples/config"
src_domains="/opt/dehydrated/app/docs/examples/domains.txt"
src_hook="/opt/dehydrated/app/docs/examples/hook.sh"

src_docker_run="/opt/dehydrated/docker-dehydrated.sh"
src_our_config="/opt/dehydrated/config"

dst_base_dir="/data"
dst_config_dir="$dst_base_dir/config"
dst_certs_dir="$dst_base_dir/certs"
dst_wellknown_dir="$dst_base_dir/wellknown"

dst_docker_run="$dst_base_dir/docker-dehydrated"
dst_config="$dst_config_dir/config"
dst_domains="$dst_config_dir/domains.txt"
dst_hook="$dst_config_dir/hook.sh"

###############################################################################

if [ ! -f $dst_config ]; then

  mkdir -p $dst_base_dir
  mkdir -p $dst_config_dir
  mkdir -p $dst_certs_dir
  mkdir -p $dst_wellknown_dir

  cp $src_docker_run $dst_docker_run
  cp $src_config $dst_config
  cp $src_domains $dst_domains
  cp $src_hook $dst_hook

  echo "Dehydrated has been prepared in data folder"
  exit 0

fi

tmpfile=$(mktemp /tmp/dehydrated-config.XXXXXX)
cat $dst_config > $tmpfile
echo "" >> $tmpfile
cat $src_our_config >> $tmpfile

exec $dehydrated -f $tmpfile $@

