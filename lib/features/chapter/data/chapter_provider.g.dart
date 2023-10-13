// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chapterDatabaseHash() => r'b086b1f151fd3bc4c65edf6d4207365a556abf9c';

/// See also [chapterDatabase].
@ProviderFor(chapterDatabase)
final chapterDatabaseProvider = AutoDisposeProvider<ChapterDatabase>.internal(
  chapterDatabase,
  name: r'chapterDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chapterDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChapterDatabaseRef = AutoDisposeProviderRef<ChapterDatabase>;
String _$chaptersHash() => r'c21b3fd48b27559417bc9679d48861f81a1967d0';

/// See also [chapters].
@ProviderFor(chapters)
final chaptersProvider = AutoDisposeStreamProvider<List<Chapter>>.internal(
  chapters,
  name: r'chaptersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chaptersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChaptersRef = AutoDisposeStreamProviderRef<List<Chapter>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
