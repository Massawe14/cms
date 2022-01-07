import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;

import '../../routing/routes.dart';
import '../authentication/authentication.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class RegistrationPage extends StatelessWidget {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  bool processing = false;

  Future registration() async {
    if (firstname.text == "" || lastname.text == "" || username.text == "" || email.text == "" 
    || password.text == "" || confirmpassword.text == "") {
      Fluttertoast.showToast(
        msg: "All fields cannot be blank",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    }
    else {
      if (password.text == confirmpassword.text) {
        var url = Uri.parse("http://192.168.137.116/DCMS/registration.php");
        var response = await http.post(url, body: {
          "firstname" : firstname.text,
          "lastname" : lastname.text,
          "email" : email.text,
          "username" : username.text,
          "password" : password.text,
        });

        var data = jsonDecode(response.body);
        if (data == "user already exists") {
          Fluttertoast.showToast(
            msg: "user already exists",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0,
          );
        }
        else {
          if (data == "success") {
            Fluttertoast.showToast(
              msg: "Registration success!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              fontSize: 16.0,
            );
            Get.offAllNamed(rootRoute);
          }
          else {
            Fluttertoast.showToast(
              msg: "Registration failed!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              fontSize: 16.0,
            );
          }
        }
      }
      else {
        Fluttertoast.showToast(
          msg: "Both password have to be the same!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400,),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                padding: const EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                child: Text(
                  'Registration',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: firstname,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'FIRST NAME',
                  prefixIcon: const Icon(
                    Icons.person,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              TextField(
                controller: lastname,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'LAST NAME',
                  prefixIcon: const Icon(
                    Icons.person,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'EMAIL',
                  prefixIcon: const Icon(
                    Icons.email,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              TextField(
                controller: username,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'USERNAME',
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                ),
              ),
              const SizedBox(height: 5.0),
              TextField(
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                ),
              ),
              const SizedBox(height: 5.0),
              TextField(
                controller: confirmpassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'CONFIRM PASSWORD',
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                ),
              ),
              const SizedBox(height: 20.0),
              GFButton(
                onPressed: () => registration(),
                text: "REGISTER",
                shape: GFButtonShape.pills,
                blockButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(height: 10.0),
              GFButton(
                onPressed: (){
                  Get.offAll(() => AuthenticationPage());
                  firstname.text = "";
                  lastname.text = "";
                  email.text = "";
                  username.text = "";
                  password.text = "";
                  confirmpassword.text = "";
                },
                text: "BACK",
                shape: GFButtonShape.pills,
                type: GFButtonType.outline,
                size: GFSize.LARGE,
                blockButton: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}