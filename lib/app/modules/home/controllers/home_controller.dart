import 'package:get/get.dart';

class HomeState {
  final int selectedIndex;
  final int counter;
  final String email, password;

  HomeState(
      {required this.selectedIndex,
      required this.email,
      required this.password,
      required this.counter});

  // copy with
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

class HomeEvent {}

class TilePressed extends HomeEvent {}

class CounterIncrementPressed extends HomeEvent {}

class EmailChanged extends HomeEvent {
  final String email;

  EmailChanged(this.email);
}

class PasswordChanged extends HomeEvent {
  final String password;

  PasswordChanged(this.password);
}

class HomeController extends GetxController {
  final homeState = HomeState.initial().obs;
  final homeEvent = HomeEvent().obs;

  onTap(int index) {
    homeState.value = homeState.value.copyWith(selectedIndex: index);
  }

  void increaseCounter() {
    homeState.value =
        homeState.value.copyWith(counter: homeState.value.counter + 1);
  }

  void onChangeEmail(String email) {
    homeState.value = homeState.value.copyWith(email: email);
  }

  void onChangePassword(String password) {
    homeState.value = homeState.value.copyWith(password: password);
  }

  void login() {
    print('email: ${homeState.value.email}');
    print('password: ${homeState.value.password}');
  }

  void mapEventToState(HomeEvent homeEvent) {}

  @override
  void onInit() {
    super.onInit();
    homeEvent.listen((p0) {
      mapEventToState(p0);
    });
    ;
  }
}
