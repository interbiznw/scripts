#!/bin/bash

#add aliases to .profile
echo "adding aliases to profile....."
echo "alias toolbox='bash -i <(curl -s https://raw.githubusercontent.com/RunOnFlux/fluxnode-multitool/master/multitoolbox.sh)'" >> ~/.profile
echo "alias status='flux-cli getzelnodestatus'" >> ~/.profile
echo "alias benchmarks='flux-cli getbenchmarks'" >> ~/.profile

#add cmds to launch on ssh login for status update
echo "adding launch status commands..."
echo "flux-cli getzelnodestatus" >> ~/.bashrc
echo "flux-cli getbenchmarks" >> ~/.bashrc

echo "all DONE! close ssh session and re-login then you can run toolbox, status, or benchmarks anytime and will get fluxnode and benchmark status upon SSH login every time."
