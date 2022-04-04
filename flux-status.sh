#!/bin/bash

aliases="alias toolbox='bash -i <(curl -s https://raw.githubusercontent.com/RunOnFlux/fluxnode-multitool/master/multitoolbox.sh)';alias status='flux-cli getzelnodestatus';alias get_benchmarks='flux-cli getbenchmarks';alias restart_zelcash='sudo systemctl restart zelcash';alias restart_benchmarks='fluxbench-cli restartnodebenchmarks';alias watch_logs='pm2 monit';alias restart_watchdog='pm2 reload watchdog --watch';alias cmds='printf '\nBelow is a list of commands you can run:\n\ncmds\ntoolbox\nstatus\nget_benchmarks\nrestart_zelcash\nrestart_benchmarks\nwatch_logs\nrestart_watchdog\n\n''"
IFS=';' read -ra aliases_array <<< "$aliases"
echo "adding aliases to profile....."
#Iterate the loop to read and check if exists and/or add aliases to .profile
  for value
  in "${aliases_array[@]}"
  do
    isInFile=$(cat ~/.profile | grep -c "$value")
    if [ $isInFile -eq 0 ]; then
      #string not contained in file
      echo "installing $value"
      echo "$value" >> ~/.profile
      
    else
      #string is in file at least once
      echo "already found $value, not installing"
    fi
    
    #echo "$value" 
  done

#add cmds to launch on ssh login for status update
commands="flux-cli getzelnodestatus;flux-cli getbenchmarks"
IFS=';' read -ra commands_array <<< "$commands"
echo "adding launch status commands..."
#Iterate the loop to read and check if exists and/or add aliases to .bashrc
  for cmdvalue
  in "${commands_array[@]}"
  do
    isInFile=$(cat ~/.bashrc | grep -c "$cmdvalue")
    if [ $isInFile -eq 0 ]; then
      #string not contained in file
      echo "installing $cmdvalue"
      echo "$cmdvalue" >> ~/.bashrc
      
    else
      #string is in file at least once
      echo "already found $cmdvalue, not installing"
    fi

  done
  
aliaslist="cmds;toolbox;status;get_benchmarks;restart_zelcash;restart_benchmarks;watch_logs;restart_watchdog"
IFS=';' read -ra aliaslist_array <<< "$aliaslist"
  for aliasvalue
  in "${aliaslist_array[@]}"
  do
    ifAliasExist=$(cat ~/.profile | grep -c "$aliasvalue")
    if [ $ifAliasExist -eq 1 ]; then
      #string not contained in file
      echo "echo 'avaliable short command: $aliasvalue'" >> ~/.bashrc
      
    else
      #string is in file at least once
      echo "$aliasvalue, alias not found, not installing"
    fi

  done 
  


echo "all DONE! close ssh session and re-login then you can run toolbox, status, or benchmarks anytime and will get fluxnode and benchmark status upon SSH login every time."
