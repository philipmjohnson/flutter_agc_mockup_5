import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../async_value_widget.dart';
import '../../drawer_view.dart';
import '../../garden/data/garden_provider.dart';
import '../../garden/domain/garden.dart';
import '../../garden/domain/garden_collection.dart';
import '../../help/presentation/help_button.dart';
import '../../news/domain/news.dart';
import '../../user/data/user_providers.dart';
import '../../user/domain/user.dart';
import '../data/chapter_provider.dart';
import '../domain/chapter.dart';
import '../domain/chapter_collection.dart';
import 'chapter_card_view.dart';

/// Builds a page containing [ChapterCardView]s.
class ChaptersView2 extends ConsumerWidget {
  const ChaptersView2({
    super.key,
  });

  static const routeName = '/chapters2';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String currentUserID = ref.watch(currentUserIDProvider);
    final AsyncValue<List<Chapter>> asyncChapters = ref.watch(chaptersProvider);
    final AsyncValue<List<Garden>> asyncGardens = ref.watch(gardensProvider);
    return MultiAsyncValuesWidget(
        context: context,
        currentUserID: currentUserID,
        asyncChapters: asyncChapters,
        asyncGardens: asyncGardens,
        data: _build);
  }

  Widget _build(
      {required BuildContext context,
      required String currentUserID,
      List<Chapter>? chapters,
      List<Garden>? gardens,
      List<News>? news,
      List<User>? users}) {
    ChapterCollection chapterCollection = ChapterCollection(chapters);
    GardenCollection gardenCollection = GardenCollection(gardens);
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: Text('Chapters (${chapterCollection.size()})'),
        actions: const [HelpButton(routeName: ChaptersView2.routeName)],
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
