import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/help_db.dart';

part 'help_provider.g.dart';

@riverpod
HelpDB helpDB(HelpDBRef ref) {
  return HelpDB(ref);
}

// Old way:
// final helpDBProvider = Provider<HelpDB>((ref) {
//   return HelpDB(ref);
// });
