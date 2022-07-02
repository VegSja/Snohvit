#!/usr/bin/env bash

echo "Installing dependencies for MagicMirror"
sleep 1
npm install --only=prod --omit=dev &

echo "Installing dependencies for MMM-Entur-tavle"
sleep 1
cd modules/MMM-Entur-tavle
npm install &
cd ../..

echo "Installation complete! Run launch.sh to launch Magic Mirror on your Raspberry PI"
