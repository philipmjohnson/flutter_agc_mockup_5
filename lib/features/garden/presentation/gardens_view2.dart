import 'package:flutter/material.dart';
import 'package:flutter_agc_mockup/agc_error.dart';
import 'package:flutter_agc_mockup/agc_loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../drawer_view.dart';
import '../../help/presentation/help_button.dart';
import '../../user/data/user_providers.dart';
import '../data/garden_provider.dart';
import '../domain/garden.dart';
import '../domain/garden_collection.dart';
import 'add_garden_view.dart';
import 'garden_summary_view.dart';

/// Builds a page presenting all of the defined [Garden].
/// This version does not use MultiAsyncValues widget.
class GardensView2 extends ConsumerWidget {
  const GardensView2({
    super.key,
  });

  static const routeName = '/gardens2';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String userID = ref.watch(currentUserIDProvider);
    final AsyncValue<List<Garden>> asyncGardens = ref.watch(gardensProvider);
    return asyncGardens.when(
        data: (gardens) => _build(context, userID, gardens),
        loading: () => const AGCLoading(),
        error: (error, stacktrace) =>
            AGCError(error.toString(), stacktrace.toString()));
  }

  Widget _build(BuildContext context, String userID, List<Garden> gardens) {
    GardenCollection gardenCollection = GardenCollection(gardens);
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: Text('Gardens (${gardenCollection.size()})'),
        actions: const [HelpButton(routeName: GardensView2.routeName)],
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
                  .getAssociatedGardens(userID: userID)
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
