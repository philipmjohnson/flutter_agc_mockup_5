import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/news.dart';
import 'news_database.dart';

part 'news_provider.g.dart';

@riverpod
NewsDatabase newsDatabase(NewsDatabaseRef ref) {
  return NewsDatabase(ref);
}

@riverpod
Stream<List<News>> news(NewsRef ref) {
  final database = ref.watch(newsDatabaseProvider);
  return database.watchNewss();
}

// Old way:
// final newsDatabaseProvider = Provider<NewsDatabase>((ref) {
//   return NewsDatabase(ref);
// });
//
// final newsProvider = StreamProvider<List<News>>((ref) {
//   final database = ref.watch(newsDatabaseProvider);
//   return database.watchNewss();
// });
