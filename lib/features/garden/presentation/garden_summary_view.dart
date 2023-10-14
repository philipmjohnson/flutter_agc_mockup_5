import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../agc_error.dart';
import '../../../agc_loading.dart';
import '../../all_data_provider.dart';
import '../../chapter/domain/chapter.dart';
import '../../chapter/domain/chapter_collection.dart';
import '../../global_snackbar.dart';
import '../domain/garden.dart';
import '../domain/garden_collection.dart';
import 'edit_garden_controller.dart';
import 'edit_garden_view.dart';
import 'garden_summary_users_view.dart';

enum GardenAction { edit, delete }

/// Builds a Card summarizing a [Garden].
class GardenSummaryView extends ConsumerWidget {
  const GardenSummaryView({Key? key, required this.garden}) : super(key: key);

  final Garden garden;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
            context: context,
            ref: ref,
            currentUserID: allData.currentUserID,
            chapters: allData.chapters,
            gardens: allData.gardens),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  // Handle the "Delete" dropdown selection.
  Future<void> _onDelete(BuildContext context, WidgetRef ref) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('This garden will be permanently deleted.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (result == null || !result) {
      return;
    }
    ref.read(editGardenControllerProvider.notifier).deleteGarden(
        garden: garden,
        onSuccess: () {
          GlobalSnackBar.show('Garden delete succeeded.');
        });
  }

  // Handle the "Edit" dropdown selection.
  Future<void> _onEdit(BuildContext context) async {
    Navigator.restorablePushNamed(context, EditGardenView.routeName,
        arguments: garden.id);
  }

  Widget _build(
      {required BuildContext context,
      required String currentUserID,
      required List<Garden> gardens,
      required List<Chapter> chapters,
      required WidgetRef ref}) {
    GardenCollection gardenCollection = GardenCollection(gardens);
    ChapterCollection chapterCollection = ChapterCollection(chapters);
    String title = garden.name;
    String subtitle = garden.description;
    String lastUpdate = garden.lastUpdate;
    String imagePath = garden.imagePath;
    String chapterName = chapterCollection
        .getChapterFromGardenID(garden.id, gardenCollection)
        .name;
    AssetImage image = AssetImage(imagePath);
    return Card(
      elevation: 9,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            isThreeLine: true,
            title: Text(title),
            subtitle: Text('$subtitle\n$chapterName Chapter'),
            trailing: PopupMenuButton<GardenAction>(
              // Callback that sets the selected popup menu item.
              onSelected: (GardenAction action) {
                if (action == GardenAction.edit) {
                  _onEdit(context);
                } else if (action == GardenAction.delete) {
                  _onDelete(context, ref);
                }
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<GardenAction>>[
                const PopupMenuItem<GardenAction>(
                  value: GardenAction.edit,
                  child: Text('Edit'),
                ),
                const PopupMenuItem<GardenAction>(
                  value: GardenAction.delete,
                  child: Text('Delete'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150.0,
            child: Ink.image(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          GardenSummaryUsersView(gardenID: garden.id),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerRight,
                child: Text('Last updated: $lastUpdate')),
          ),
        ],
      ),
    );
  }
}
