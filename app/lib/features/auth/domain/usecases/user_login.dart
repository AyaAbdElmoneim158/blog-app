import 'package:app/core/error/failures.dart';
import 'package:app/core/helper/usecase.dart';
import 'package:fpdart/fpdart.dart';
import '../repositories/auth_repository.dart';

class UserLogin implements UseCase<String, UserLoginParams> {
  AuthRepository authRepository;
  UserLogin(this.authRepository);

  @override
  Future<Either<Failure, String>> call(params) async {
    return await authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;
  UserLoginParams({
    required this.email,
    required this.password,
  });
}
