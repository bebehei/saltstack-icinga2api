{% from "monitoring/map.jinja" import icinga2_vals with context %}

include:
  - .plugins

icinga2:
  pkg.installed:
    - pkgs:
      - icinga2
    - require:
      - pkgrepo: icinga2
  pkgrepo.managed:
    - ppa: formorer/icinga
    - refresh: True
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: icinga2
