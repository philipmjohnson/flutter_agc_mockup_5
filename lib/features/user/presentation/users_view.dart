import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../agc_error.dart';
import '../../agc_loading.dart';
import '../../all_data_provider.dart';
import '../../chapter/domain/chapter.dart';
import '../../chapter/domain/chapter_collection.dart';
import '../../drawer_view.dart';
import '../../garden/domain/garden.dart';
import '../../garden/domain/garden_collection.dart';
import '../../help/presentation/help_button.dart';
import '../domain/user.dart';
import '../domain/user_collection.dart';
import 'user_card_view.dart';

const pageSpecification = '''
# Users Page Specification

## Motivation/Goals

We want this page to facilitate the creation of a local "Community of Practice".

On the other hand, we want to preserve privacy. 

So, we will need to ability for members to manage how much of their information is made available to others. 

## Contents

Since people can be part of more than one Chapter, we might have to have a top-level card or maybe an expandable card? 

It should list the "public profile" for a member, which could include their username, the gardens they own, maybe something about their crops.  

## Actions 

It should be possible to message members.  This seems crucial to create a community of practice.

If folks can be messaged, then it should also be possible for a member to block messages from another person. 

Maybe you can request "messaging privilege" or something from another member, so by default you can't message others? 

''';

/// Builds a page containing [UserCardView] information.
class UsersView extends ConsumerWidget {
  const UsersView({
    super.key,
  });

  static const routeName = '/users';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
            context: context,
            currentUserID: allData.currentUserID,
            chapters: allData.chapters,
            users: allData.users,
            gardens: allData.gardens),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
      required String currentUserID,
      required List<Garden> gardens,
      required List<User> users,
      required List<Chapter> chapters}) {
    GardenCollection gardenCollection = GardenCollection(gardens);
    ChapterCollection chapterCollection = ChapterCollection(chapters);
    UserCollection userCollection = UserCollection(users);
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: Text('Members (${userCollection.size()})'),
        actions: const [HelpButton(routeName: UsersView.routeName)],
      ),
      body: ListView(children: [
        ...chapterCollection
            .getAssociatedUsersOfUserID(
                currentUserID, gardenCollection, userCollection)
            .map((user) => UserCardView(user: user))
      ]),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed needed when more than 3 items
        items: const [
          BottomNavigationBarItem(
            label: 'Filter',
            icon: Icon(Icons.filter_list),
          ),
          BottomNavigationBarItem(
            label: 'Sort',
            icon: Icon(Icons.sort),
          ),
        ],
      ),
    );
  }
}
