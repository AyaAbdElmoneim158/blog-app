import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/blog/presentation/pages/add_new_blog_page.dart';
import '../../features/blog/presentation/pages/blog_page.dart';
import 'routes.dart';

class AppRouter {
  static Route? onGenerate(RouteSettings settings) {
    // final args = settings.arguments as String;

    switch (settings.name) {
      case AppRoutes.initRoute:
        return pageTransition(settings, const SplashPage());
      case AppRoutes.login:
        return pageTransition(settings, const LoginPage(), type: PageTransitionType.bottomToTop);
      case AppRoutes.register:
        return pageTransition(settings, const SignUpPage(), type: PageTransitionType.rightToLeft);
      case AppRoutes.home:
        return pageTransition(settings, const BlogPage(), type: PageTransitionType.rightToLeft);
      case AppRoutes.addPost:
        return pageTransition(settings, const AddNewBlogPage(), type: PageTransitionType.rightToLeft);
      case AppRoutes.noFoundRoute:
      default:
        return pageTransition(settings, const NotFoundPage());
    }
  }

  static PageTransition<dynamic> pageTransition(
    RouteSettings settings,
    Widget screen, {
    PageTransitionType type = PageTransitionType.fade,
  }) {
    return PageTransition(
      type: type,
      child: screen,
      settings: settings,
    );
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("NotFoundPage"),
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SplashPage"),
      ),
    );
  }
}
