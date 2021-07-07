class AppState {
  final int currentIndex;
  final AuthState authState;

  AppState({required this.currentIndex, required this.authState});

  AppState.initialState()
      : currentIndex = 0,
        authState = AuthState.initialState();

  AppState copyWith({int? currentIndex, AuthState? authState}) {
    return AppState(
        currentIndex: currentIndex ?? this.currentIndex,
        authState: authState ?? this.authState);
  }
}

class AuthState {
  static const signUp = 0;
  static const logIn = 1;
  static const forgotPassword = 2;
  final int authPage;

  AuthState({required this.authPage});

  AuthState.initialState() : authPage = 0;
}
