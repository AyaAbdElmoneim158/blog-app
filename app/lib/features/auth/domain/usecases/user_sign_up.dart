import 'package:app/core/error/failures.dart';
import 'package:app/core/helper/usecase.dart';
import 'package:fpdart/fpdart.dart';
import '../repositories/auth_repository.dart';

class UserSignUp implements UseCase<String, UserSignUpParams> {
  AuthRepository authRepository;
  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, String>> call(params) async {
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
