import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../agc_error.dart';
import '../../../agc_loading.dart';
import '../../multi_async_values_provider.dart';
import '../domain/garden.dart';
import '../domain/garden_collection.dart';
import 'garden_summary_view.dart';

/// Builds a list of [GardenSummaryView].
class GardensBodyView extends ConsumerWidget {
  const GardensBodyView({
    super.key,
  });

  final String title = 'Gardens';

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
    GardenCollection gardenCollection = GardenCollection(gardens);
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
            children: gardenCollection
                .getAssociatedGardens(userID: currentUserID)
                .map((garden) => GardenSummaryView(garden: garden))
                .toList()));
  }
}
