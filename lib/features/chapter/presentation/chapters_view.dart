import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../agc_error.dart';
import '../../agc_loading.dart';
import '../../all_data_provider.dart';
import '../../drawer_view.dart';
import '../../garden/domain/garden.dart';
import '../../garden/domain/garden_collection.dart';
import '../../help/presentation/help_button.dart';
import '../domain/chapter.dart';
import '../domain/chapter_collection.dart';
import 'chapter_card_view.dart';

/// Builds a page containing [ChapterCardView]s.
class ChaptersView extends ConsumerWidget {
  const ChaptersView({
    super.key,
  });

  static const routeName = '/chapters';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
            context: context,
            currentUserID: allData.currentUserID,
            gardens: allData.gardens,
            chapters: allData.chapters),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
      required String currentUserID,
      required List<Chapter> chapters,
      required List<Garden> gardens}) {
    ChapterCollection chapterCollection = ChapterCollection(chapters);
    GardenCollection gardenCollection = GardenCollection(gardens);
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: Text('Chapters (${chapterCollection.size()})'),
        actions: const [HelpButton(routeName: ChaptersView.routeName)],
      ),
      body: ListView(children: [
        ...chapterCollection
            .getAssociatedChapterIDs(currentUserID, gardenCollection)
            .map((chapterID) => ChapterCardView(chapterID: chapterID))
      ]),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed, // needed when more than 3 items
        items: const [
          BottomNavigationBarItem(
            label: 'Filter',
            icon: Icon(Icons.filter_list),
          ),
          BottomNavigationBarItem(
            label: 'Sort',
            icon: Icon(Icons.sort),
          ),
        ],
      ),
    );
  }
}
