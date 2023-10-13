// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garden_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gardenDatabaseHash() => r'142a6b99d03fdbe56dc9320ea7586b3c54728b38';

/// See also [gardenDatabase].
@ProviderFor(gardenDatabase)
final gardenDatabaseProvider = AutoDisposeProvider<GardenDatabase>.internal(
  gardenDatabase,
  name: r'gardenDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gardenDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GardenDatabaseRef = AutoDisposeProviderRef<GardenDatabase>;
String _$gardensHash() => r'652c1f3cc0f5c31c59294173340338013693cdea';

/// See also [gardens].
@ProviderFor(gardens)
final gardensProvider = AutoDisposeStreamProvider<List<Garden>>.internal(
  gardens,
  name: r'gardensProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gardensHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GardensRef = AutoDisposeStreamProviderRef<List<Garden>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
