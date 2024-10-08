import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routing/routes.dart';
import '../../../../config/theme/app_pallette.dart';
import '../../../../core/common/cubits/app_user/app_user_cubit.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/helper_functions.dart';
import '../bloc/blog_bloc.dart';
import '../widgets/blog_editor.dart';

class AddNewBlogPage extends StatefulWidget {
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<String> selectedTopics = [];
  File? image;

  void selectImage() async {
    final pickedImage = await AppHelperFunctions.pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  void uploadBlog() {
    if (formKey.currentState!.validate() && selectedTopics.isNotEmpty && image != null) {
      final posterId = (context.read<AppUserCubit>().state as AppUserLoggedIn).user.id;
      context.read<BlogBloc>().add(
            BlogUpload(
              posterId: posterId,
              title: titleController.text.trim(),
              content: contentController.text.trim(),
              image: image!,
              topics: selectedTopics,
            ),
          );
    }
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => uploadBlog(),
            icon: const Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: _listener,
        builder: (context, state) => (state is BlogLoading)
            ? const Loader()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        image != null ? buildSelectedImage() : buildDottedBorder(),
                        const SizedBox(height: 20),
                        buildTopicsScrollView(),
                        const SizedBox(height: 10),
                        BlogEditor(controller: titleController, hintText: 'Blog title'),
                        const SizedBox(height: 10),
                        BlogEditor(controller: contentController, hintText: 'Blog content'),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  GestureDetector buildDottedBorder() {
    return GestureDetector(
      onTap: () => selectImage(),
      child: DottedBorder(
        color: AppPallette.borderColor,
        dashPattern: const [10, 4],
        radius: const Radius.circular(10),
        borderType: BorderType.RRect,
        strokeCap: StrokeCap.round,
        child: const SizedBox(
          height: 150,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.folder_open,
                size: 40,
              ),
              SizedBox(height: 15),
              Text(
                'Select your image',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildSelectedImage() {
    return GestureDetector(
      onTap: selectImage,
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(
            image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildTopicsScrollView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: Constants.topics
            .map(
              (e) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    if (selectedTopics.contains(e)) {
                      selectedTopics.remove(e);
                    } else {
                      selectedTopics.add(e);
                    }
                    setState(() {});
                  },
                  child: Chip(
                    label: Text(e),
                    color: selectedTopics.contains(e)
                        ? const WidgetStatePropertyAll(
                            AppPallette.gradient1,
                          )
                        : null,
                    side: selectedTopics.contains(e)
                        ? null
                        : const BorderSide(
                            color: AppPallette.borderColor,
                          ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  void _listener(context, state) {
    if (state is BlogFailure) {
      AppHelperFunctions.showSnackBar(context, state.error);
    } else if (state is BlogUploadSuccess) {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false);
    }
  }
}
