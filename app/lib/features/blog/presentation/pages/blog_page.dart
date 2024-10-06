import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routing/routes.dart';
import '../../../../config/theme/app_pallette.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/helper/helper_functions.dart';
import '../bloc/blog_bloc.dart';
import '../widgets/blog_card.dart';

class BlogPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const BlogPage(),
      );
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(BlogFetchAllBlogs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog App'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.addPost),
            icon: const Icon(CupertinoIcons.add_circled),
          ),
        ],
      ),
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogFailure) {
            AppHelperFunctions.showSnackBar(context, state.error);
          }
        },
        builder: (context, state) => (state is BlogLoading)
            ? const Loader()
            : (state is BlogsDisplaySuccess)
                ? ListView.builder(
                    itemCount: state.blogs.length,
                    itemBuilder: (context, index) {
                      final blog = state.blogs[index];
                      return BlogCard(
                        blog: blog,
                        color: index % 2 == 0 ? AppPallette.gradient1 : AppPallette.gradient2,
                      );
                    },
                  )
                : const SizedBox(),
      ),
    );
  }
}
