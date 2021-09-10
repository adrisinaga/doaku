import 'package:doaku/core/model/login_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthUninitialized extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String? role;

  const AuthAuthenticated({this.role});

  @override
  List<Object> get props => [role!];
}

class AuthUnauthenticated extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final LoginModel? loginModel;

  const AuthLoginSuccess({this.loginModel});

  @override
  List<Object> get props => [loginModel!];
}

class AuthLoginFailed extends AuthState {
  final String? errorMessage;

  const AuthLoginFailed({this.errorMessage});

  @override
  List<Object> get props => [errorMessage ?? ''];
}

class AuthLogoutSuccess extends AuthState {}

class AuthLogoutFailed extends AuthState {
  final String? errorMessage;

  const AuthLogoutFailed({this.errorMessage});

  @override
  List<Object> get props => [errorMessage ?? ''];
}
