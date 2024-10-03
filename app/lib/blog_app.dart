import 'package:flutter/material.dart';

import 'config/routing/router.dart';
import 'config/routing/routes.dart';
import 'core/helper/constants.dart';
import 'config/theme/theme.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appTitle,
      theme: AppTheme.darkThemeMode,
      onGenerateRoute: AppRouter.onGenerate,
      initialRoute: AppRoutes.initRoute,
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) => const NotFoundPage(),
      ),
      home: const BlogPage(),
    );
  }
}

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog App'),
      ),
      body: const Center(
        child: Text('Blog Posts will appear here'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
