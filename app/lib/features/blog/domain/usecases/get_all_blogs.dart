import 'package:app/core/error/failures.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/helper/usecase.dart';
import '../entities/blog.dart';
import '../repositories/blog_repo.dart';

class GetAllBlogs implements UseCase<List<Blog>, NoParams> {
  BlogRepo blogRepo;
  GetAllBlogs(this.blogRepo);

  @override
  Future<Either<Failure, List<Blog>>> call(NoParams params) async {
    return await blogRepo.getAllBlogs();
  }
}
