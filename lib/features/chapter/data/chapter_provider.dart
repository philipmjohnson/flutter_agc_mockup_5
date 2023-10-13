import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/chapter.dart';
import 'chapter_database.dart';

part 'chapter_provider.g.dart';

@riverpod
ChapterDatabase chapterDatabase(ChapterDatabaseRef ref) {
  return ChapterDatabase(ref);
}

@riverpod
Stream<List<Chapter>> chapters(ChaptersRef ref) {
  final database = ref.watch(chapterDatabaseProvider);
  return database.watchChapters();
}

// Old way:
// /// Riverpod provider for [ChapterDatabase].
// final chapterDatabaseProvider = Provider<ChapterDatabase>((ref) {
//   return ChapterDatabase(ref);
// });
//
// /// Riverpod provider for the current list of [Chapter].
// final chaptersProvider = StreamProvider<List<Chapter>>((ref) {
//   final database = ref.watch(chapterDatabaseProvider);
//   return database.watchChapters();
// });
