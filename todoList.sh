#!/bin/bash

# (c) Nolan Lapham

trap 'do_menu' 2

. ./library_todo.sh

show_menu()
{
  echo
  echo
  echo "-- ToDo List --"
  echo "1. List"
  echo "2. Add"
  echo "3. Edit"
  echo "4. Remove"
  echo "5. Mark important"
  echo "q. Quit"
  echo -en "Enter your selection: "
}

do_menu()
{
  input=-1

  while [ "$i" != "q" ]; do
    show_menu
    read input
    echo
    case $input in
      "1")
      list_todo
      ;;
      "2")
      add_todo
      ;;
      "3")
      edit_todo
      ;;
      "4")
      remove_todo
      ;;
      "5")
      mark_important_todo
      ;;
      "q")
      echo "So long my friend"
      exit 0
      ;;
      *)
      echo "Unrecognized input"
      ;;
    esac
  done
}

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
