import 'package:clean_getx_bloc_pattern/app/modules/home/controllers/home_events.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => controller.addEvent(CounterIncrementPressed())),
      body: Obx(() {
        final state = controller.homeState.value;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              for (int index = 0; index < 5; index++)
                ListTile(
                  onTap: () => controller.addEvent(TilePressed(index: index)),
                  title: Text('hello'),
                  selected: index == state.selectedIndex,
                ),
              Center(
                  child: Text(
                'Counter : ${state.counter}',
                style: TextStyle(fontSize: 20),
              )),
              // email field
              TextField(
                onChanged: (_) => controller.addEvent(EmailChanged(_)),
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // password field
              TextField(
                onChanged: (_) => controller.addEvent(PasswordChanged(_)),
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              // login button
              SizedBox(height: 10),
              Text('Email : ${state.email}'),
              Text('Password : ${state.password}'),
              SizedBox(height: 50),

/*
              TextButton(
                onPressed: () => controller.addEvent(LoginPressed()),
                child: Text('Login'),
              ),
*/
            ],
          ),
        );
      }),
    );
  }
}
