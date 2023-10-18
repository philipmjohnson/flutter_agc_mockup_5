import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/garden.dart';

/// Provides access to the Firestore database storing [Garden] documents.
class GardenDatabase {
  GardenDatabase(this.ref);

  final ProviderRef<GardenDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Garden>> watchGardens() => _service.watchCollection(
      path: FirestorePath.gardens(),
      builder: (data, documentId) => Garden.fromJson(data!));

  Stream<Garden> watchGarden(String gardenId) => _service.watchDocument(
      path: FirestorePath.garden(gardenId),
      builder: (data, documentId) => Garden.fromJson(data!));

  Future<List<Garden>> fetchGardens() => _service.fetchCollection(
      path: FirestorePath.gardens(),
      builder: (data, documentId) => Garden.fromJson(data!));

  Future<Garden> fetchGarden(String gardenId) => _service.fetchDocument(
      path: FirestorePath.garden(gardenId),
      builder: (data, documentId) => Garden.fromJson(data!));

  Future<void> setGarden(Garden garden) => _service.setData(
      path: FirestorePath.garden(garden.id), data: garden.toJson());

  Future<void> setGardenDelayed(Garden garden) => Future.delayed(
      const Duration(milliseconds: 2000),
      () => _service.setData(
          path: FirestorePath.garden(garden.id), data: garden.toJson()));

  Future<void> setGardenError(Garden garden) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteGarden(Garden garden) =>
      _service.deleteData(path: FirestorePath.garden(garden.id));
}
