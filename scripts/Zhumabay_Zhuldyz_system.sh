#!/bin/bash
DIR="$(cd "$(dirname "$0")/.." && pwd)"
echo "=============================="
echo "Student Information"
echo "=============================="
echo
echo "Name: Zhuldyz"
echo "Surname: Zhumabay"
echo "Group: IT2-2308"
echo "Student ID: 37947"
echo
echo "=============================="
echo "System Information"
echo "=============================="
echo
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -s -r)"
echo "Disk Usage:"; df -h / | tail -1
echo "Memory Usage:"
if command -v free >/dev/null; then free -h; else vm_stat | head -5; fi
echo
if [ -f "$DIR/Zhumabay_Zhuldyz_info.txt" ]; then
  echo "Student information file exists."
else
  echo "Student information file does not exist."
fi
