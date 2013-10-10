```
title: Project S8
layout: clientproject
tags: ['clientproject']
clientname: (names redacted)
icon: super8.png
technologies: ['Video', 'Video Recording', 'OpenGL ES 2.0', 'iPhone', 'Audio Unit', 'AVFoundation', 'Facebook', 'Twitter', 'Vimeo', 'OAuth-2', 'Video Upload', 'YouTube', 'Bitly', 'Live Rendering', 'Live Preview', 'Procedural Sound Effects', 'Procedural Textures', 'Video Compositing', 'ESSL', 'Animation', 'Notification Center', 'HockeyApp', 'Airplay', 'Concurrency']
roles: ['Lead Developer']
categories: ['Video', 'Entertainment', 'Social Networking']
date: 2011-01-01
startdate: January 2011
duration: 11 Months
device: iPhone
```
#### Summary

*This project has not been released and is currently of unknown status. Any identifying features have been removed.*

Project S8 was a vintage video effects app unlike anything that's currently available. While staying true to the 4:3 "Super 8" format, it delivered a crisp, modern UI and immersive experience. Every pixel was crafted under a magnifying glass by the client's artists. Users could select from several "cartridges" with which to record their video. Once chosen, the user was immersed in the world of their creation with a live preview of their footage with all cartridge effects applied. Detailed visual artefacts, formulae and design made sure that no two "reels" were the same by randomising a plethora of effects and values. What resulted was nothing short of an incredibly convincing vintage video simulation.

#### Features

- Rich, immersive, finely-detailed interface with smooth, vivid animation
- 4-Input (projector-sound, noise, music and original audio) 16-bit stereo realtime DSP mixing system
- Authentic-sounding procedurally-generated pop and hiss noise effects
- All audio and video effect formulae relied on random seeds to ensure unique "reels" every time
- Ability to use iTunes music or provided stock music to mix with (or replace) recorded audio
- Video effects reproduced in ESSL with painstaking detail (film roll, jitter, artefacts, vignette, blur, grain)
- Thousands of artefacts, lines and distortions packed into texture atlases
- A video rendering and recording system with live processing of multiple layered special effects
- Zero render time for finished footage (unless remixing or playback on an Airplay device was required)
- Airplay integration

#### Notable Achievements

- Impressed the respective managers of the Australian App Store and WWDC at Apple’s Sydney Headquarters by demonstrating the app in person
- The DSP system was constructed using a dynamic (can alter at runtime) Audio Unit graph, which included stacking several layers of iPod EQ nodes to produce the right kind of filtered sound, among much else
- The pop and hiss sounds (also Audio Unit nodes) were entirely procedurally generated and randomised to be different each time
- Recreated several Adobe Photoshop post-processing effects in ESSL and spent weeks optimising for highest frame rate
- Unhappy with the performance and limitations of particle-based effects, I improved on them with my own highly-optimised quad-based particle system, taking into account hardware optimisations and tricks
- Wrote a background process to queue and upload videos to multiple social networking sites and cross-post links to the content once uploaded (upload once, share to many)
- Searching for formulaic methods of shape-generation, wrote a variant of Johan Geilis’s Superformula that makes unique shapes easy to author, lightweight to store and fast to deploy
- Built a UIScrollView replacement for browsing transparent image thumbnails at high speeds