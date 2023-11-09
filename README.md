# Flutter mockup of the Agile Garden Club app (Phase 5)

This repository contains a mockup of the Agile Garden Club application.

The main features added to this version include:

### 1. A working backend database

This version uses Firebase Firestore for backend storage and Firebase Authentication for user registration and signin.

See the code in lib/repositories/firestore

### 2. Sample data to check deserialization of domain model classes

To help ensure that the domain model classes are defined correctly, sample JSON data for all domain model classes are stored in assets/initialData. 

Then, when the system starts up, the verifyInitialData() method is called in main.dart to simply check that this JSON data can be read in without an error. 

### 3. Domain model classes use Freezed to support ADT and serial/deserialization

See Chapter, Garden, News, and User features for examples. 

### 4. Flex Color Scheme for a custom color scheme

This system uses a built-in theme from Flex Color Scheme to provide a custom color scheme. See main.dart for details. 

### 5. Flutter Native Splash for a custom splash screen

Tired of seeing a blank screen while your app initializes? This system uses Flutter Native Splash to show the AGC logo while the system initializes.

See the Flutter Native Splash documentation for instructions. It is mostly specified in pubspec.yml.

### 6. Riverpod 2 annotations to simplify provider declarations.

Once you get the hang of them, Riverpod annotations are totally the best way to define providers. 

They are defined in the data/ directories. See chapter_provider.dart, garden_provider.dart, help_provider.dart, and news_provider.dart.

### 7. AllData to support retrieval of multiple collections

In many situations, a screen will need data from multiple collections in order to display itself correctly. 

We also want the screen to automatically update when another client modifies the database (the canonical example is a chat client, where you want to see new messages without refreshing the page).

The AllData class (and associated provider) illustrates one way to easily provide a screen with data from multiple collections.

### 8. Riverpod's AsyncValue to manage AllDataProvider return states

The all_data_provider.dart file defines a provider called AllDataProvider. It returns an AsyncValue when watched. This AsyncValue makes it easy to display different things on the screen depending upon what state the AsyncValue is in (data, loading, error).

See chapters_view.dart, gardens_view.dart, news_body_view.dart for examples. 

### 9. Global Snack Bar for notification

When you add or edit a domain entity, it is nice to have the system confirm that the update was successful.  See add_garden_view, edit_garden_view, or garden_summary_view.dart for examples of the use of the Global Snackbar.

See global_snackbar.dart and main.dart for how to set it up.

### 10. Controller design pattern for data mutation

Andrea Bizzotti documents a nice controller-based design pattern for data mutation (i.e. creating, updating, and deleting domain entities). See below for a link.

You can see an implementation of this design pattern in edit_garden_controller.dart. Only the Garden domain entity supports CRUD in this example system.


### Background reading

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
