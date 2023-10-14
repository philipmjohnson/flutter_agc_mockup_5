import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../agc_error.dart';
import '../../../agc_loading.dart';
import '../../chapter/domain/chapter.dart';
import '../../chapter/domain/chapter_collection.dart';
import '../../garden/domain/garden.dart';
import '../../garden/domain/garden_collection.dart';
import '../../all_data_provider.dart';
import '../domain/user.dart';
import 'user_avatar.dart';

// Builds a Card that summarizes information about a User.
class UserCardView extends ConsumerWidget {
  const UserCardView({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
            context: context,
            currentUserID: allData.currentUserID,
            chapters: allData.chapters,
            gardens: allData.gardens),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
      required String currentUserID,
      required List<Garden> gardens,
      required List<Chapter> chapters}) {
    GardenCollection gardenCollection = GardenCollection(gardens);
    ChapterCollection chapterCollection = ChapterCollection(chapters);
    List<String> gardenNames = gardenCollection
        .getAssociatedGardenIDs(userID: user.id)
        .map((gardenID) => gardenCollection.getGarden(gardenID))
        .map((gardenData) => gardenData.name)
        .toList();
    List<String> chapterNames = chapterCollection
        .getAssociatedChapterIDs(user.id, gardenCollection)
        .map((chapterID) => chapterCollection.getChapter(chapterID))
        .map((chapterData) => chapterData.name)
        .toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 8,
          child: Column(
            children: [
              ListTile(
                  leading: UserAvatar(userID: user.id),
                  trailing: const Icon(Icons.more_vert),
                  title: Text(user.username)),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Garden(s): ${gardenNames.join(", ")}')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Chapter(s): ${chapterNames.join(", ")}')),
              ),
              const SizedBox(height: 10)
            ],
          )),
    );
  }
}
