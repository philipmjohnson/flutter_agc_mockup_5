# Flutter mockup of the Agile Garden Club app (Phase 5)

This repository contains a mockup of the Agile Garden Club application.

The main changes in this version include:
* Firebase Firestore as the backend storage.
* Firebase authentication for user registration and signin.
* The assets/initialData directory contains sample data. It's checked against data model classes on startup to ensure data model and sample data are in sync, structurally speaking.
* Freezed to create data model classes with serialization and deserialization.
* FlexColorScheme for theme
* Flutter Native Splash for a custom splash screen
* Riverpod 2 annotations to declare providers. 
* AsyncValue for asynchronous processing. 
* GlobalSnackBar for notification.

Helpful reference articles for Riverpod include:
* <https://codewithandrea.com/articles/flutter-riverpod-generator/>
* <https://codewithandrea.com/articles/data-mutations-riverpod/>


## Screen shots

Here are screen shots that illustrate current application state. We use the flutter_markdown package to provide information on what should appear in a page when we haven't gotten around to actually mocking up the contents.

Click on any screen shot to see it full-size.

### Splash, signin, and signup pages:

<p style="text-align: center">
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/splash.png" width="30%">
&nbsp; &nbsp; 
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/signin.png" width="30%">
&nbsp; &nbsp; 
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/signup.png" width="30%">
</p>

### Home page: My News, My Gardens, My Discussions

<p style="text-align: center">
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/home-my-news.png" width="30%">
&nbsp; &nbsp; 
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/home-my-gardens.png" width="30%">
&nbsp; &nbsp; 
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/home-my-discussions.png" width="30%">
</p>

### Navigation Drawer, Gardens, and Chapters pages

<p style="text-align: center">
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/drawer.png" width="30%">
&nbsp; &nbsp; 
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/gardens.png" width="30%">
&nbsp; &nbsp; 
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/chapters.png" width="30%">
</p>

### Add Garden and Edit Garden

<p style="text-align: center">
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/add-garden.png" width="30%">
&nbsp; &nbsp; 
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/edit-garden.png" width="30%">
</p>

### Outcomes, Seeds, Members pages

<p style="text-align: center">
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/outcomes.png" width="30%">
&nbsp; &nbsp; 
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/seeds.png" width="30%">
&nbsp; &nbsp; 
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/members.png" width="30%">
</p>

### Discussions page

<p style="text-align: center">
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/discussions.png" width="30%">
</p>

### Help

<p style="text-align: center">
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/help.png" width="30%">
&nbsp; &nbsp; 
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/help-local.png" width="30%">
</p>


## Installation

First, clone or fork this repo and download the source code to your local computer.

Second, set up a Firestore database.  You can follow the [Firestore Setup Cheat Sheet](https://courses.ics.hawaii.edu/mobile-application-development/morea/data/reading-firestore-setup-cheat-sheet.html).

Third, you will want to initialize your Firestore database with example data. There is example data in the assets/initialData directory. The most convenient way we know to upload JSON files to Firestore is through Firefoo.  For further information, see these [instructions for uploading data to Firestore with Firefoo](https://courses.ics.hawaii.edu/mobile-application-development/morea/data/reading-firefoo.html).

Important note: when initializing the database with sample data, you must tell Firestore to use the "id" field in the sample data as the documentID.  The system code depends upon that equivalency.
