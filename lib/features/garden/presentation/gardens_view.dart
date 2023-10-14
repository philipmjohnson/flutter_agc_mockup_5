import 'package:flutter/material.dart';
import 'package:flutter_agc_mockup/agc_error.dart';
import 'package:flutter_agc_mockup/agc_loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../drawer_view.dart';
import '../../help/presentation/help_button.dart';
import '../../all_data_provider.dart';
import '../domain/garden.dart';
import '../domain/garden_collection.dart';
import 'add_garden_view.dart';
import 'garden_summary_view.dart';

/// Builds a page presenting all of the defined [Garden].
class GardensView extends ConsumerWidget {
  const GardensView({
    super.key,
  });

  static const routeName = '/gardens';

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
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: Text('Gardens (${gardenCollection.size()})'),
        actions: const [HelpButton(routeName: GardensView.routeName)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.restorablePushNamed(context, AddGardenView.routeName);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
              children: gardenCollection
                  .getAssociatedGardens(userID: currentUserID)
                  .map((garden) => GardenSummaryView(garden: garden))
                  .toList())),
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[],
        ),
      ),
    );
  }
}
