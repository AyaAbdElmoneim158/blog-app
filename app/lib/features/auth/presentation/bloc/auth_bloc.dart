import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/user_login.dart';
import '../../domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserSignUp userSignUp;
  UserLogin userLogin;

  AuthBloc({
    required this.userSignUp,
    required this.userLogin,
  }) : super(AuthInitial()) {
    on<AuthSignUp>(_authSignUp);
    on<AuthLogin>(_authLogin);
  }

  FutureOr<void> _authSignUp(event, emit) async {
    emit(AuthLoading());
    final res = await userSignUp.call(
      UserSignUpParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.msg)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  FutureOr<void> _authLogin(event, emit) async {
    emit(AuthLoading());
    final res = await userLogin.call(
      UserLoginParams(
        password: event.password,
        email: event.email,
      ),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.msg)),
      (uid) => emit(AuthSuccess(uid)),
    );
  }
}
