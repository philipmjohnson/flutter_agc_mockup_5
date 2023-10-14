import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../agc_error.dart';
import '../../../agc_loading.dart';
import '../../chapter/domain/chapter.dart';
import '../../chapter/domain/chapter_collection.dart';
import '../../garden/domain/garden.dart';
import '../../garden/domain/garden_collection.dart';
import '../../multi_async_values_provider.dart';
import '../domain/news.dart';
import '../domain/news_collection.dart';
import 'news_body_item_actions.dart';

/// Builds a news item given its ID.
class NewsBodyItemView extends ConsumerWidget {
  const NewsBodyItemView({
    super.key,
    required this.newsID,
  });

  final String newsID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
            context: context,
            currentUserID: allData.currentUserID,
            gardens: allData.gardens,
            news: allData.news,
            chapters: allData.chapters),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
      required String currentUserID,
      required List<Chapter> chapters,
      required List<News> news,
      required List<Garden> gardens}) {
    ChapterCollection chapterCollection = ChapterCollection(chapters);
    GardenCollection gardenCollection = GardenCollection(gardens);
    NewsCollection newsCollection = NewsCollection(news);
    News data = newsCollection.getNews(newsID);
    // TODO: set the icon from the data.icon field.
    IconData icon = Icons.newspaper;
    String title = data.title;
    String body = data.body;
    String date = data.date;
    String? chapterID = data.chapterID;
    String? gardenID = data.gardenID;

    /// Only one of chapterID or gardenID is defined.
    String chapterName = (chapterID == null)
        ? ''
        : '${chapterCollection.getChapter(chapterID).name} Chapter';
    String gardenName = (gardenID == null)
        ? ''
        : '${gardenCollection.getGarden(gardenID).name} Garden';
    String bodyPrefix = '$chapterName$gardenName';
    return Column(children: [
      ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text('$title ($date)'),
        subtitle: Text('$bodyPrefix\n$body'),
        trailing: const NewsBodyItemActions(),
      ),
      const Divider(),
    ]);
  }
}
