# Attacca DMX

Attacca DMX is a project that allows for DMX control over remote audio players and smart home devices. The system runs quite well on a modern Raspberry Pi.

## Features

- Playback control (play, pause, stop)
- Playlist selection
- Track selection
- Volume control
- Playback options (shuffle, repeat, single, consume, crossfade)
- Automated volume fades
- Multiple instances of the music player, all sharing the same audio library
- State control of smart home devices (just on/off so far)
- Multiple instances of the smart home controller

## Use Cases

My original intent was to design a "poor man's" DMX audio server that would play theatrical sound effects on cue. It needed to handle playing one or two ambient sounds on a loop at the same time as the shorter cued sounds. As I met this original goal, I wondered if I could add theatrical control to the house lights as well. A Z-Wave wall switch and the Almond+ router made this goal possible.

## Hardware Requirements

For control of audio, all that's required is a Raspberry Pi and an external sound card (even a cheap one is better than the built-in analogue audio on the Pi). For control of smart home devices, a Securifi Almond+ router (or similar model) is also required. This router offers a local WebSocket API to control its associated Z-Wave and Zigbee devices.

## Warnings

Because I maintain this project for my own use as a theater technician, I'm only releasing it here as a courtesy to the community. I will make updates, but they will skew towards my use cases. Please feel free to use the code here and adapt it to your specific situation. If you'd like to make changes adapting it to a wider audience, I'll entertain them.

If you decide to use this project in a production environment, be warned: there are glitches. I make absolutely no guarantees that it won't crash and burn in a fiery mess. Currently, the project is documented poorly. As I make updates, I plan to improve this some. I am relatively new to programming and have learned most of it by trial and error (including GitHub).

## Setup

If you've read all the warnings and still want to try setting it up, see the [setup procedure](SETUP.md). You'll need some familiarity with the Linux terminal, but most of you here on GitHub checked that box a long time ago.

## Acknowledgements

This project would not be possible without these truly excellent platforms:

- [Open Lighting Architecture](https://www.openlighting.org/ola/)
- [Music Player Daemon](https://www.musicpd.org)