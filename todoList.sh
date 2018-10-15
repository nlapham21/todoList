#!/bin/bash

# (c) Nolan Lapham

trap 'do_menu' 2

. ./library_todo.sh

# Add, Remove, Edit, Mark important

 ###############################################
 ########### Main script starts here ###########
 ###############################################

### Setup todo list file if needed
if [ ! -f $TODO_LIST ]; then
  echo "Creating $TODO_LIST..."
  touch $TODO_LIST
fi

if [ ! -r $TODO_LIST ]; then
  echo "Error: $TODO_LIST is not readable"
  exit 1
fi

if [ ! -w $TODO_LIST ]; then
  echo "Error: $TODO_LIST is not writable"
  exit 2
fi

do_menu
