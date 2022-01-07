import 'dart:convert';

import 'package:cms/constants/style.dart';
import 'package:cms/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;

import '../../routing/routes.dart';
import '../registration/registration.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class AuthenticationPage extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login() async {
    if (username.text == "" || password.text == "") {
      Fluttertoast.showToast(
        msg: "Both fields cannot be blank!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    }
    else {
      var url = Uri.parse("http://192.168.137.116/DCMS/login.php");
      var response = await http.post(url, body: {
        "username" : username.text,
        "password" : password.text,
      });

      var data = jsonDecode(response.body);
      if (data == "dont have an account") {
        Fluttertoast.showToast(
          msg: "dont have an account, create an account!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      }
      else {
        if (data == "failed") {
          Fluttertoast.showToast(
            msg: "incorrect username or password!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0,
          );
        }
        else {
          // ignore: avoid_print
          print(data); 
          Get.offAllNamed(rootRoute);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400,),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                child: Text(
                  'DCMS',
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
                controller: username,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "USERNAME",
                  prefixIcon: const Icon(
                    Icons.person,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: password,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "PASSWORD",
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: true, 
                        onChanged: (value){},
                      ),
                      const CustomText(
                        text: "Remember me",
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){},
                    child: const CustomText(
                      text: "Forgot password",
                      color: active,
                    ),
                  ),  
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              // InkWell(
              //   onTap: (){
              //     Get.offAllNamed(rootRoute);
              //     // Get.offAll(() => SiteLayout());
              //   },
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: active,
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     alignment: Alignment.center,
              //     width: double.maxFinite,
              //     padding: const EdgeInsets.symmetric(vertical: 16),
              //     child: const CustomText(
              //       text: "LOGIN",
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              GFButton(
                onPressed: () => login(),
                text: "LOGIN",
                shape: GFButtonShape.pills,
                blockButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  Get.offAll(() => RegistrationPage());
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account?",
                      ),
                      TextSpan(
                        text: "Register here",
                        style: TextStyle(
                          color: active,
                        ),
                      ),
                    ],
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