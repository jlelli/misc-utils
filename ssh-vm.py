#! /usr/bin/python
import sys
import subprocess

macs = {'guest1-debian-64': '52:54:00:91:57:c9',
        'guest2-debian-64': '52:54:00:e2:d9:51'}

def bash_command(cmd):
    p = subprocess.Popen(cmd.split(), stdout = subprocess.PIPE)
    return p.communicate()[0]

def main(argv):
    guest = argv[0]
    #print "connecting to " + guest + "..."
    if guest not in macs:
        exit(1)

    hosts = bash_command("nmap -sP 10.30.3.101-240")
    arplist = bash_command("arp -n").split('\n')

    for arpline in arplist[:-1]:
        mac = str.split(arpline)
        if mac[2] == macs[guest]:
            print "juri@" + mac[0] 

if __name__ == "__main__":
    main(sys.argv[1:])

# vim: set ts=4 expandtab:
