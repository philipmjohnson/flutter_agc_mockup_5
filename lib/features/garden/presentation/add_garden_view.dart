import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../agc_error.dart';
import '../../../agc_loading.dart';
import '../../chapter/domain/chapter.dart';
import '../../chapter/domain/chapter_collection.dart';
import '../../help/presentation/help_button.dart';
import '../../all_data_provider.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import '../data/garden_database.dart';
import '../data/garden_provider.dart';
import '../domain/garden.dart';
import '../domain/garden_collection.dart';
import 'form-fields/chapter_dropdown_field.dart';
import 'form-fields/description_field.dart';
import 'form-fields/editors_field.dart';
import 'form-fields/garden_name_field.dart';
import 'form-fields/photo_field.dart';
import 'form-fields/reset_button.dart';
import 'form-fields/submit_button.dart';
import 'form-fields/utils.dart';
import 'form-fields/viewers_field.dart';
import 'gardens_view.dart';

/// Create a new Garden.
class AddGardenView extends ConsumerWidget {
  AddGardenView({Key? key}) : super(key: key);

  static const routeName = '/addGardenView';
  final _formKey = GlobalKey<FormBuilderState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _descriptionFieldKey = GlobalKey<FormBuilderFieldState>();
  final _chapterFieldKey = GlobalKey<FormBuilderFieldState>();
  final _photoFieldKey = GlobalKey<FormBuilderFieldState>();
  final _editorsFieldKey = GlobalKey<FormBuilderFieldState>();
  final _viewersFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
            context: context,
            currentUserID: allData.currentUserID,
            gardens: allData.gardens,
            users: allData.users,
            chapters: allData.chapters,
            ref: ref),
        loading: () => const AGCLoading(),
        error: (error, stacktrace) =>
            AGCError(error.toString(), stacktrace.toString()));
  }

  Widget _build(
      {required BuildContext context,
      required String currentUserID,
      required List<Garden> gardens,
      required List<Chapter> chapters,
      required List<User> users,
      required WidgetRef ref}) {
    ChapterCollection chapterCollection = ChapterCollection(chapters);
    GardenCollection gardenCollection = GardenCollection(gardens);
    UserCollection userCollection = UserCollection(users);
    List<String> chapterNames = chapterCollection.getChapterNames();

    void onSubmit() {
      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
      if (!isValid) return;
      // Since validation passed, we can safely access the values.
      String name = _nameFieldKey.currentState?.value;
      String description = _descriptionFieldKey.currentState?.value;
      String chapterID = chapterCollection
          .getChapterIDFromName(_chapterFieldKey.currentState?.value);
      String imageFileName = _photoFieldKey.currentState?.value;
      String editorsString = _editorsFieldKey.currentState?.value ?? '';
      List<String> editorIDs = usernamesToIDs(userCollection, editorsString);
      String viewersString = _viewersFieldKey.currentState?.value ?? '';
      List<String> viewerIDs = usernamesToIDs(userCollection, viewersString);
      int numGardens = gardenCollection.size();
      String id = 'garden-${(numGardens + 1).toString().padLeft(3, '0')}';
      String imagePath = 'assets/images/$imageFileName';
      String lastUpdate = DateFormat.yMd().format(DateTime.now());
      Garden garden = Garden(
          id: id,
          name: name,
          description: description,
          imagePath: imagePath,
          chapterID: chapterID,
          lastUpdate: lastUpdate,
          ownerID: currentUserID,
          viewerIDs: viewerIDs,
          editorIDs: editorIDs);
      GardenDatabase gardenDatabase = ref.watch(gardenDatabaseProvider);
      gardenDatabase.setGarden(garden);
      // Return to the list gardens page
      Navigator.pushReplacementNamed(context, GardensView.routeName);
    }

    void onReset() {
      _formKey.currentState?.reset();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Garden'),
          actions: const [HelpButton(routeName: AddGardenView.routeName)],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            Column(
              children: [
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      GardenNameField(fieldKey: _nameFieldKey),
                      DescriptionField(fieldKey: _descriptionFieldKey),
                      ChapterDropdownField(
                          fieldKey: _chapterFieldKey,
                          chapterNames: chapterNames),
                      PhotoField(fieldKey: _photoFieldKey),
                      EditorsField(
                          fieldKey: _editorsFieldKey,
                          userCollection: userCollection),
                      ViewersField(
                          fieldKey: _viewersFieldKey,
                          userCollection: userCollection),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SubmitButton(onSubmit: onSubmit),
                    ResetButton(onReset: onReset),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
