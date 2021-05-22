import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:my_wedding_test/repository/user_repository.dart';
import 'package:my_wedding_test/utils/user/user_util.dart';
import 'package:mysql1/mysql1.dart';

part 'authentication_state.dart';

part 'authentication_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStarted) {
      yield* _mapAuthenticationStartedToState();
    } else if (event is AuthenticationLoggedIn) {
      yield* _mapAuthenticationLoggedInToState(event.id, event.pwd);
    } else if (event is AuthenticationLoggedOut) {
      yield* _mapAuthenticationLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationStartedToState() async* {
    yield AuthenticationProgressing();
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedInToState(
      String id, String pwd) async* {
    try {
      ResultRow user = await UserRepository().signIn(id, pwd);
      UserUtil.setUser(user);
      print('Login User Name : ' + UserUtil.getUser().name);
      yield AuthenticationSuccess(UserUtil.getUser().name);
    } catch (e) {
      print(e);
      yield AuthenticationFailure();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedOutToState() async* {
    yield AuthenticationProgressing();
    _userRepository.signOut();
  }
}
