import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../agc_error.dart';
import '../../agc_loading.dart';
import '../../all_data_provider.dart';
import '../domain/news.dart';
import '../domain/news_collection.dart';
import 'news_body_item_view.dart';

/// Builds a list of [NewsBodyItemView] (if there are any).
class NewsBodyView extends ConsumerWidget {
  const NewsBodyView({
    super.key,
  });

  final String title = 'News';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
            context: context,
            currentUserID: allData.currentUserID,
            news: allData.news),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
      required String currentUserID,
      required List<News> news}) {
    NewsCollection newsCollection = NewsCollection(news);
    List<String> newsIDs = newsCollection.getAssociatedNewsIDs(currentUserID);
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: (newsIDs.isEmpty)
            ? const Align(
                alignment: Alignment.center,
                child: Text("No news is good news!"))
            : ListView(children: [
                ...newsIDs
                    .map((newsID) => NewsBodyItemView(newsID: newsID))
                    .toList()
              ]));
  }
}
