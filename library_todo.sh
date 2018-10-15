#!/usr/bin/bash

# Global variables
TODO_LIST=todoList
export TODO_LIST

list_todo()
{
  count=0
  while read -r line; do
    count=$((count+1))
    echo -e "$count: $line"
    count=$((count+1))
  done < "$TODO_LIST"
  if [ $count -eq 0 ]; then
    echo "Nothing todo!"
  fi
}

add_todo()
{
  echo "What is the task to be added?"
  read input;
  echo $input >> $TODO_LIST
}

edit_todo()
{
  echo "Edit needs to be built"
}

remove_todo()
{
  echo "Which task would you like to remove? (enter number)"
  read input;
  sed '/1/d' $TODO_LIST
  echo
  # check whether remove worked
  echo "Task $input removed."
}

mark_important_todo()
{
  echo "Mark important needs to be built"
}
