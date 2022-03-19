# SocialSearchHub

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
SocialSearchHub is a hub for users to search for topics, ideas, and pictures within multiple social media apps at one time. Users will be able to 

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Search Engine
- **Mobile:** Push notifications, real-time
- **Story:** A streamlined view of selected social media for users
- **Market:** Avid social media users
- **Habit:** Everyday -- would be a user's main search engine for social media posts
- **Scope:** Core features is to see sign in and see a feed of their app.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
* The user can sign up and create a new account
* The user can log into the app
* The user can log out of the app
* The user can view the selected social media post from within a table view
* The user can add searches to their favorites
* The user can search for specific topics
* The user can toggle Dark / Light mode

**Optional Nice-to-have Stories**
* User can be taken to actual X social media app.
* The user can log into their social media apps to save posts for later
* Enable Push notifiactions 
    

### 2. Screen Archetypes
- Login Screen
    - The user can log into the app
- Sign Up Screen
    - The user can sign up and create a new account
- Home Screen
    - The user can search for specific topics
- Feed Screen
    - The user can view the selected social media post from within a table view
- Profile Screen
    - The user can add searches to their favorites
- Settings Screen
    - The user can log out of the app 
    - The user can toggle Dark / Light mode


### 3. Navigation

**Tab Navigation** (Tab to Screen)
- Home 
- Profile
- Settings

**Flow Navigation** (Screen to Screen)
- Login Screen
    - => Sign up screen
    - => Home screen
- Sign Up Screen
    - => Login Screen
    - => Home Screen
- Home Screen
    - => Profile Screen
    - => Settings Screen
    - => Feed Screen
- Profile Screen
    - => Feed Screen
    - => Settings Screen
    - => Home Screen
- Feed Screen
    - => Home Screen
    - => Settings Screen
    - => Profile Screen

## Wireframes

![](https://i.imgur.com/EllWlcZ.jpg)

## Schema 
[This section will be completed in Unit 9]
### Models
#### User
- username
- password
- email
#### Post
- image (can be nil)
- caption
- user
- source (social media)
### Networking
Twitter Content
- GET /tweets: https://api.twitter.com/1.1/search/tweets.json
Instagram Content
- GET /{ig-hashtag-id}/top_media — to get the most popular photos and videos that have a specific hashtag
