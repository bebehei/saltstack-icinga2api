{% from "monitoring/map.jinja" import icinga2_vals with context %}

icinga2-sudoers:
  file.managed:
    - name: /etc/sudoers.d/icinga
    - makedirs: True
    - mode: 400
    - user: root
    - group: root
    - source: salt://monitoring/sudoers/icinga

monitoring-packages:
  pkg.installed:
    - pkgs:
      - sysstat
      - lm-sensors
      - smartmontools
      - libconfig-json-perl
      - nagios-plugins
      - nagios-plugins-contrib
      - nagios-plugins-basic
      - nagios-plugins-common
      - nagios-plugins-contrib
      - nagios-plugins-extra
      - nagios-plugins-openstack
      - nagios-plugins-standard   
