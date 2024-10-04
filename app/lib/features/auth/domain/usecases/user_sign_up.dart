import 'package:app/core/error/failures.dart';
import 'package:app/core/helper/usecase.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/common/entities/user.dart';
import '../repositories/auth_repository.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  AuthRepository authRepository;
  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;
  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
