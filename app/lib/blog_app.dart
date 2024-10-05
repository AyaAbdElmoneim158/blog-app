import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routing/router.dart';
import 'config/routing/routes.dart';
import 'core/common/cubits/app_user/app_user_cubit.dart';
import 'core/helper/constants.dart';
import 'config/theme/theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';

class BlogApp extends StatefulWidget {
  const BlogApp({super.key});

  @override
  State<BlogApp> createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

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
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          return (isLoggedIn) ? const BlogPage() : const LoginPage();
        },
      ),
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
