import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/garden_database.dart';
import '../data/garden_provider.dart';
import '../domain/garden.dart';

part 'edit_garden_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class EditGardenController extends _$EditGardenController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
  }

  Future<void> updateGarden(
      {required Garden garden,
      required VoidCallback onSuccess,
      required VoidCallback onError}) async {
    state = const AsyncLoading();
    GardenDatabase gardenDatabase = ref.watch(gardenDatabaseProvider);
    final newState =
        await AsyncValue.guard(() => gardenDatabase.setGarden(garden));
    if (mounted) {
      state = newState;
      if (state.hasError) {
        onError();
      }
      if (state.hasValue) {
        onSuccess();
      }
    } else {
      onSuccess();
    }
  }

  Future<void> deleteGarden(
      {required Garden garden, required VoidCallback onSuccess}) async {
    state = const AsyncLoading();
    GardenDatabase gardenDatabase = ref.watch(gardenDatabaseProvider);
    final newState =
        await AsyncValue.guard(() => gardenDatabase.deleteGarden(garden));
    if (mounted) {
      state = newState;
      if (state.hasError == false) {
        onSuccess();
      }
    } else {
      onSuccess();
    }
  }
}
