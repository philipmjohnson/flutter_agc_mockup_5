// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsDatabaseHash() => r'f302f41e742856ac86119bb0f4ab349d2e9abb84';

/// See also [newsDatabase].
@ProviderFor(newsDatabase)
final newsDatabaseProvider = AutoDisposeProvider<NewsDatabase>.internal(
  newsDatabase,
  name: r'newsDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newsDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NewsDatabaseRef = AutoDisposeProviderRef<NewsDatabase>;
String _$newsHash() => r'988f04fb9a9c3de5914f47c21c6bbce38cedf56d';

/// See also [news].
@ProviderFor(news)
final newsProvider = AutoDisposeStreamProvider<List<News>>.internal(
  news,
  name: r'newsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NewsRef = AutoDisposeStreamProviderRef<List<News>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
