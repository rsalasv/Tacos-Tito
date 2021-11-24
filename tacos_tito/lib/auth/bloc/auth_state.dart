part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AlreadyAuthState extends AuthState {
  final bool isAdmin;

  AlreadyAuthState({required this.isAdmin});
}

class UnAuthState extends AuthState {}
