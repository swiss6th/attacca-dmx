fade_time="1"
target_volume="1"

# Playlist
1	1-100	`olat_playlist "${slot_value}"`
# Volume
2	1-101	`olat_volume "${slot_value}"`
# Track
3	1-100	`olat_play "${slot_value}"`
# Crossfade
4	1-101	`olat_crossfade "${slot_value}"`
# Single
5	1		`olat_single off`
5	2		`olat_single on`
# Repeat
6	1		`olat_repeat off`
6	2		`olat_repeat on`
# Random
7	1		`olat_random off`
7	2		`olat_random on`
# Fade Time
8	1-101	fade_time="${slot_value}"
# Target Volume
9	1-101	target_volume="${slot_value}"
# Playback
10	1		`olat_stop`
10	2		`olat_pause`
10	3		`olat_resume`
10	4		`olat_fadevol "${fade_time}" "${target_volume}"`
# Seek
11	1-101	`olat_seek "${slot_value}"`
