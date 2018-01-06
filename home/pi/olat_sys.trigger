command=""
# House lights
1	1		`olat_ha_sensor "1" "1" "false"`
1	2		`olat_ha_sensor "1" "1" "true"`

# System volume
2	1-152	`olat_sysvol "${slot_value}"`

# System mute 
3	1		`olat_sysmute unmute`
3	2		`olat_sysmute mute`

# System command
4	254		command="sudo reboot"
4	255		command="sudo poweroff"
4	%		command=""

# Execution of command
5	255		`olat_syscmd "${command}"`

# Sound & embedded lights
#6	1		`olat_ha_sensor "4" "1" "false"`
#6	2		`olat_ha_sensor "4" "1" "true"`

# Stage-Right Tree
#7	1		`olat_ha_sensor "2" "1" "false"`
#7	2		`olat_ha_sensor "2" "1" "true"`

# Stage-Left Tree
#8	1		`olat_ha_sensor "3" "1" "false"`
#8	2		`olat_ha_sensor "3" "1" "true"`

# Theater Equipment
# 9	1		`olat_ha_scene "1"`
# 9	2		`olat_ha_scene "2"`

# HA Dimmer Test
# 7	0-100		`olat_ha_sensor "49" "1" "${slot_value}"`
