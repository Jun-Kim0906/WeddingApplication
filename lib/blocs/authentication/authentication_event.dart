part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticationLoggedIn extends AuthenticationEvent {
  final String id;
  final String pwd;

  AuthenticationLoggedIn({@required this.id, @required this.pwd}):super();
}

class AuthenticationLoggedOut extends AuthenticationEvent {}
