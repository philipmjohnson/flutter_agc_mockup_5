import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/garden.dart';
import 'garden_database.dart';

part 'garden_provider.g.dart';

@riverpod
GardenDatabase gardenDatabase(GardenDatabaseRef ref) {
  return GardenDatabase(ref);
}

@riverpod
Stream<List<Garden>> gardens(GardensRef ref) {
  final database = ref.watch(gardenDatabaseProvider);
  return database.watchGardens();
}

// Old way:
// final gardenDatabaseProvider = Provider<GardenDatabase>((ref) {
//   return GardenDatabase(ref);
// });
//
// final gardensProvider = StreamProvider<List<Garden>>((ref) {
//   final database = ref.watch(gardenDatabaseProvider);
//   return database.watchGardens();
// });
