import 'dart:io';
import 'package:app/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/helper/usecase.dart';
import '../entities/blog.dart';
import '../repositories/blog_repo.dart';

class UploadBlog implements UseCase<Blog, UploadBlogParams> {
  BlogRepo blogRepo;
  UploadBlog(this.blogRepo);

  @override
  Future<Either<Failure, Blog>> call(UploadBlogParams params) async {
    return await blogRepo.uploadBlog(
      content: params.content,
      image: params.image,
      posterId: params.posterId,
      title: params.title,
      topics: params.topics,
    );
  }
}

class UploadBlogParams {
  final File image;
  final String title;
  final String content;
  final String posterId;
  final List<String> topics;

  UploadBlogParams({
    required this.posterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}
