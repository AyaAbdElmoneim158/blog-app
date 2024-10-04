part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String userId;
  const AuthSuccess(this.userId);
}

class AuthFailure extends AuthState {
  final String msg;
  const AuthFailure(this.msg);
}
