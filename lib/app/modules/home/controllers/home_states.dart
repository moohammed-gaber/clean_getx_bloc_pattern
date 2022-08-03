class HomeState {
  final int selectedIndex;
  final int counter;
  final String email, password;

  HomeState(
      {required this.selectedIndex,
      required this.email,
      required this.password,
      required this.counter});

  HomeState copyWith(
      {int? selectedIndex, int? counter, String? email, String? password}) {
    return HomeState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        counter: counter ?? this.counter,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  factory HomeState.initial() => HomeState(
        selectedIndex: 0,
        counter: 0,
        email: '',
        password: '',
      );
}
