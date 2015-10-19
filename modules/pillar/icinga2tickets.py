#!/usr/bin/env python2

import subprocess

def ext_pillar( minion_id, pillar, *args, **kwargs ):
    """
    Return an icinga2 Ticket generated on the icinga2 master.
    If no arguments given, it will execute icinga2 on the salt-master itself.
    
    If any arguments given, it will execute the command by the arguments.
    To use the master on "icinga2host", pass the arguments like this:

    # /etc/salt/master.d/external-pillar.conf
    ext_pillar:
          - icinga2tickets:
            - command:
              - ssh
              - icinga2host
              - icinga2
              - pki
              - ticket
              - --cn
    """
    cn = minion_id

    try:
        for arg in args:
            command = arg['command'] + [cn]
    except:
        command = ["icinga2", "pki", "ticket", "--cn", cn]

    return {"icinga2": {"ticket": subprocess.check_output(command)}}
