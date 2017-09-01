#!/bin/bash
echo -e "Nhap vao dai mang can quet: (VD: 191.168.1.0/24)"
read net
echo "Scanning..."

sudo nmap -sS -p 22,3389 $net -oA report > /dev/null 2>&1;

cat report.gnmap | grep 22/open | cut -d" " -f 1,2 | sed 's/$/\ is Linux./';
echo;
cat report.gnmap | grep 3389/open | cut -d" " -f 1,2 | sed 's/$/\ is Windows./';
echo;
cat report.gnmap | egrep '22/clo|3389/clo|22/fil|3389/fil' | cut -d" " -f 1,2 | sed 's/$/\ is Unknown./';
echo;
#done

