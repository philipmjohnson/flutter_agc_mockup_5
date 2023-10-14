import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../agc_error.dart';
import '../../../agc_loading.dart';
import '../../all_data_provider.dart';
import '../../user/presentation/user_labeled_avatar.dart';
import '../domain/garden.dart';
import '../domain/garden_collection.dart';

/// Builds a row of User avatars associated with a gardenID.
class GardenSummaryUsersView extends ConsumerWidget {
  const GardenSummaryUsersView({Key? key, required this.gardenID})
      : super(key: key);

  final String gardenID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
            context: context,
            currentUserID: allData.currentUserID,
            gardens: allData.gardens),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
      required String currentUserID,
      required List<Garden> gardens}) {
    double padding = 10;
    Garden garden = GardenCollection(gardens).getGarden(gardenID);
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      UserLabeledAvatar(
          userID: garden.ownerID, label: 'Owner', rightPadding: padding),
      ...garden.editorIDs
          .map((editorID) => UserLabeledAvatar(
              userID: editorID, label: 'Editor', rightPadding: padding))
          .toList(),
      ...garden.viewerIDs
          .map((editorID) => UserLabeledAvatar(
              userID: editorID, label: 'Viewer', rightPadding: padding))
          .toList(),
    ]);
  }
}
