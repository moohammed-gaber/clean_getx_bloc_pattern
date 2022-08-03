import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.increaseCounter();
      }),
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() {
        final state = controller.homeState.value;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              for (int index = 0; index < 5; index++)
                ListTile(
                  onTap: () => controller.onTap(index),
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
                onChanged: controller.onChangeEmail,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // password field
              TextField(
                onChanged: controller.onChangePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              // login button
              TextButton(
                onPressed: controller.login,
                child: Text('Login'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
