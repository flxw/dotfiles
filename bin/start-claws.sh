#!/bin/sh

eval `gpg-agent --daemon`
claws-mail
killall gpg-agent
