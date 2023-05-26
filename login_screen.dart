import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class LoginScreen extends StatelessWidget {
  final inputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Login Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Spacer(),
              TextFormField(
                controller: inputController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email must be not empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
                  hintText: 'email',
                  suffixIcon: Icon(Icons.email),
                  suffixIconColor: Colors.deepOrange,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                color: Colors.deepOrange,
                child: MaterialButton(
                  onPressed: () async {
                      Dio dio = Dio(BaseOptions(
                        contentType: 'application/'
                      ));
                      var res = await dio.post(
                        'https://www.savehappykids.com/bus_nav_sys.php',
                        data: FormData.fromMap({
                          'option': '1',
                          'email': inputController.text.trim(),
                        }),
                      );
                      print(res);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
