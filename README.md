# Flutter mockup of the Agile Garden Club app (Phase 5)

This repository contains a mockup of the Agile Garden Club application.

The main changes in this version include:
* Firebase Firestore for backend storage.
* Firebase Authentication for user registration and signin.
* The assets/initialData directory contains sample data. It's checked against data model classes on startup to ensure data model and sample data are in sync, structurally speaking.
* Freezed for data model classes with serialization and deserialization.
* FlexColorScheme for theme.
* Flutter Native Splash for a custom splash screen
* Riverpod 2 annotations for provider declaration.
* Riverpod's AsyncValue to support asynchronous processing. 
* GlobalSnackBar for notification.
* A custom widget called "AllData" to support retrieval of multiple collections

To make this system easier to understand, you might want to read the following Code With Andrea articles. This system follows those recommendations:
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

### Add, Edit, and Delete Garden

<p style="text-align: center">
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/add-garden.png" width="30%">
&nbsp; &nbsp; 
  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/edit-garden.png" width="30%">

  <img src="https://github.com/philipmjohnson/flutter_agc_mockup_5/raw/main/README-screenshots/delete-garden.png" width="30%">
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

Invoke `flutter run` to run the system. You can ask Philip for credentials to login as a test user. 

The system is connected to a Firestore database, which was initialized with example data from the assets/initialData directory. The most convenient way we know to upload JSON files to Firestore is through Firefoo.  For further information, see these [instructions for uploading data to Firestore with Firefoo](https://courses.ics.hawaii.edu/mobile-application-development/morea/data/reading-firefoo.html).

Important note: when initializing the database with sample data, you must tell Firestore to use the "id" field in the sample data as the documentID.  This system is designed to depend upon that equivalency. 

If you want to try setting up this system to use a different Firestore database, you can follow the [Firestore Setup Cheat Sheet](https://courses.ics.hawaii.edu/mobile-application-development/morea/data/reading-firestore-setup-cheat-sheet.html).
