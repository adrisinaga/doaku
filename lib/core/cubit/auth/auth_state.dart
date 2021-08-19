import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthUninitialized extends AuthState {}

class AuthAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthUnauthenticated extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String? errorMessage;
  const AuthFailure({this.errorMessage});
  @override
  List<Object> get props => [errorMessage??''];
}
