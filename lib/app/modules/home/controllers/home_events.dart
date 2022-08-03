class HomeEvent {}

class TilePressed extends HomeEvent {
  final int index;

  TilePressed({required this.index});
}

class CounterIncrementPressed extends HomeEvent {}

class EmailChanged extends HomeEvent {
  final String email;

  EmailChanged(this.email);
}

class PasswordChanged extends HomeEvent {
  final String password;

  PasswordChanged(this.password);
}
