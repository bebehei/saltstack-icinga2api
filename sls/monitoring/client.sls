{% from "monitoring/map.jinja" import icinga2_vals with context %}

include:
  - .

icinga2-client:
  icinga2.client:
    - master: {{ icinga2_vals.master }}
    - ticket: {{ pillar['icinga2']['ticket'] }}
    - require:
      - pkg: icinga2
    - require_in:
      - service: icinga2

	# don't execute on the master the service-checks.
	# all service-checks should be executed by the master
  cmd.wait:
    - name: rm -f {{ icinga2_vals.dirbase }}/conf.d/services.conf {{ icinga2_vals.dirbase }}/conf.d/apt.conf
    - watch:
      - pkg: icinga2
    - require_in:
      - service: icinga2
