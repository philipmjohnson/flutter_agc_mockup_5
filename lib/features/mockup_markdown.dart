import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'drawer_view.dart';

/// Build a page presenting the specification of a page's contents in Markdown.
class MockupMarkdownView extends StatelessWidget {
  const MockupMarkdownView({Key? key, this.title = "Title", this.data = "Data"})
      : super(key: key);

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerView(),
        appBar: AppBar(
          title: Text(title),
        ),
        body: Markdown(data: data));
  }
}
