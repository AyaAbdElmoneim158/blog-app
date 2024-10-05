part of 'blog_bloc.dart';

abstract class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {}

final class BlogFailure extends BlogState {
  final String error;
  const BlogFailure(this.error);
}

final class BlogUploadSuccess extends BlogState {}

final class BlogsDisplaySuccess extends BlogState {
  final List<Blog> blogs;
  const BlogsDisplaySuccess(this.blogs);
}
