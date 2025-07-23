import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Helper function to build pages with platform-adaptive transitions
Page<dynamic> buildPageWithPlatformTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    return CupertinoPage(key: state.pageKey, child: child);
  }
  return MaterialPage(key: state.pageKey, child: child);
}
