import 'package:flutter/material.dart';

import '../../mockup_markdown.dart';

const pageSpecification = '''
# Discussions Page Specification

## Motivation/Goals

Another important part of creating a community of practice within a Chapter is by facilitating conversations. 

So, we need some sort of simple discussion board. 

Would be nice to find some sort of plugin for this.

## Contents 

* Discussion Board 

## Actions 

* Ability to read, post, mark as read, etc. 


''';

/// Builds a page containing information about discussions.
class DiscussionsView extends StatelessWidget {
  const DiscussionsView({
    super.key,
  });
  final String title = 'Discussions';
  static const routeName = '/discussions';

  @override
  Widget build(BuildContext context) {
    return MockupMarkdownView(title: title, data: pageSpecification);
  }
}
