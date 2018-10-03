# Artcrawler

[artcrawler.herokuapp.com](https://artcrawler.herokuapp.com/)

This app uses Ruby On Rails and the Google Maps API to create a system for organizing and mapping open studios events for organizers, artists, and visitors.

The open studios event presents a unique problem in that it is a single event that can occur in hundreds of different locations within a given area. Individual artists' studios, studio buildings, galleries, and other venues need to be listed and mapped so that visitors can navigate between them in the course of a single weekend. 

Arts organizations typically either make their own apps for each event or rely on printed booklets. The purpose of this app is to create a single app that can be used for many events. I also use Google Waypoints to create a system with which visitors can choose which studios they want to visit and have them appear as a route on a personalized map. They can also bookmark individual artists and recieve a feed of information about when and where those artists' work is being shown.

In the future I would like to make this into a mobile app and provide more information through custom map markers. I also will add the ability to provide open and closing times for individual locations and allow them to list amenities and accessibility concerns.

Currently the events and artists listed are all fake for demonstration purposes.
Images are randomly generated using Lorem Flickr and Lorem Picsum.

Gems I use:
will_paginate 
figaro
faker
httparty
validates_timeliness

