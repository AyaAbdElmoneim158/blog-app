import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/usecase.dart';
import '../../domain/entities/blog.dart';
import '../../domain/usecases/get_all_blogs.dart';
import '../../domain/usecases/upload_blog.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;
  final GetAllBlogs _getAllBlogs;
  BlogBloc({
    required UploadBlog uploadBlog,
    required GetAllBlogs getAllBlogs,
  })  : _uploadBlog = uploadBlog,
        _getAllBlogs = getAllBlogs,
        super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogUpload>(_onBlogUpload);
    on<BlogFetchAllBlogs>(_onFetchAllBlogs);
  }

  void _onBlogUpload(event, emit) async {
    UploadBlogParams params = UploadBlogParams(
      posterId: event.posterId,
      title: event.title,
      content: event.content,
      image: event.image,
      topics: event.topics,
    );
    final res = await _uploadBlog.call(params);
    res.fold(
      (failure) => emit(BlogFailure(failure.msg)),
      (r) => emit(BlogUploadSuccess()),
    );
  }

  void _onFetchAllBlogs(event, emit) async {
    final res = await _getAllBlogs.call(NoParams());
    res.fold(
      (failure) => emit(BlogFailure(failure.msg)),
      (blogs) => emit(BlogsDisplaySuccess(blogs)),
    );
  }
}
