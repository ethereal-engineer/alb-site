```
title: Songl
layout: clientproject
tags: ['clientproject']
clientname: Red Unicorn
subclientname: Digital Music Distribution (DMD)
icon: songl.jpg
technologies: ['AVFoundation', 'iPhone', 'iPad', 'Pagination', 'REST', 'Facebook', 'Keychain', 'Encryption', 'Google Analytics', 'Flurry', 'NSOperationQueue', 'GCD', 'Background Tasks', 'Background Audio', 'DRM', 'CocoaHTTPServer', 'Offline Sync', 'HTTPRangeRequests', 'RNCryptor', 'MongoDB', 'Core Data', 'New Relic', 'iOS 7', 'Smart Banners', 'File Downloads', 'HockeyApp', 'Airplay', 'Concurrency']
roles: ['Lead Developer']
storeurl: https://itunes.apple.com/au/app/songl/id547165902
ipadstoreurl: https://itunes.apple.com/au/app/songl-for-ipad/id566177173
categories: ['Music', 'Entertainment']
startdate: July 2012
duration: 15 Months
device: iPhone and iPad
```
#### Summary

Songl is a streaming music app for iPhone and iPad. DMD is a joint venture between Sony Music, Universal Music and (later) Southern Cross Austereo (SCA). This app allows them to highlight popular content to users while providing curated playlists of different genres. Users can also create their own playlists and even store them on their device for offline use. The iPad version includes live access to all SCA digital radio stations as well as related video content.

#### Features

- On-Demand music playback of tracks, playlists and albums
- Offline mode disables online portions of the app when no connection is available
- Offline playlists download tracks for use without the internet

#### Notable Achievements

- Integrated the iOS Keychain with RNCryptor to create a fast, secure DRM system for artist's content
- Created a CocoaHTTPServer-based HTTP proxy with streaming encryption/decryption and ranged-request handling 
- Designed a user session watchdog for policing free trials and user privileges
- Built a low-latency, robust AVPlayer-based music player for local and network streams
- Made an automatic background subsystem that keeps users online and offline playlists in sync