import 'package:clean_getx_bloc_pattern/app/modules/home/controllers/home_events.dart';
import 'package:clean_getx_bloc_pattern/app/modules/home/controllers/home_states.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final homeState = HomeState.initial().obs;
  final homeEvent = HomeEvent().obs;

  addEvent(HomeEvent event) {
    homeEvent.value = event;
  }

  void mapEventToState(HomeEvent event) {
    if (event is TilePressed) {
      homeState.value = homeState.value.copyWith(selectedIndex: event.index);
    }
    if (event is CounterIncrementPressed) {
      homeState.value =
          homeState.value.copyWith(counter: homeState.value.counter + 1);
    }
    if (event is EmailChanged) {
      homeState.value = homeState.value.copyWith(email: event.email);
    }
    if (event is PasswordChanged) {
      homeState.value = homeState.value.copyWith(password: event.password);
    }
  }

  @override
  void onInit() {
    super.onInit();
    homeEvent.listen((p0) {
      mapEventToState(p0);
    });
  }
}
