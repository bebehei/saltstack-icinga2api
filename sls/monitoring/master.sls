{% from "monitoring/map.jinja" import icinga2_vals with context %}

include:
  - .

icinga2-master:
  git.latest:
    - name: {{ icinga2.gitrepo }}
    - target: {{ icinga2.dirbase }}
    - force_checkout: True
    - submodules: True
    - require_in:
      - pkg: icinga2

  icinga2.master:
    - master: {{ icinga2_vals.master }}
    - master_zone: {{ icinga2_vals.master }}
    - require:
      - pkg: icinga2
    - require_in:
      - service: icinga2
