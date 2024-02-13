import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:robisalesautomation/model/User.dart';
import 'package:robisalesautomation/sqldatabasees/UserDatabase.dart';
import 'package:robisalesautomation/utility/mycolors.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final UserDatabase dbHelper = UserDatabase();
  final Dio dio = Dio();

  Future<void> login(BuildContext context) async {
    final loginData = [
      {
        'user': usernameController.text,
        'password': passwordController.text,
        'organization': '', // Add organization data if needed
      }
    ];
    print(loginData);
    try {
      final response = await dio.post(
        'https://starlineerp.com/CloudERP/sec_mod/api/api_users.php',
        data: loginData,
      );

      if (response.data != null) {
        print(response.data);
        final user = User.fromJson(jsonDecode(response.data));

        // Save user data to SQLite
        await dbHelper.saveUser(user);

        // Now, you can navigate to the home screen or perform any other action
        Navigator.pushReplacementNamed(context, '/homepage');
      } else {
        // Handle case when response data is null
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Username/password not match'),
          ),
        );
      }
    } catch (error) {
      // Handle API request error
      print('API Request Error: $error');
      print('Error Message: ${error}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${error}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                // height: MediaQuery.of(context).size.height* 0.5,
                width: MediaQuery.of(context).size.width * 0.3,
                child: Image.asset(
                  'assets/images/robilogo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Text('LOG IN',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'User ID',
                      hintText: "User ID",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    login(context);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 8.0, // Adjust the elevation
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),

                    backgroundColor: Appcolors.primary,
                  ),
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
