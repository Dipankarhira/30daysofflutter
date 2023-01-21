import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool buttonChange = false;

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        buttonChange = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        buttonChange = false;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/login.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter Username", labelText: "Username"),
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value != null && value.length < 6) {
                            return "password must be more than 6 characters";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "Enter password", labelText: "password"),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      InkWell(
                        onTap: () async {
                          moveToHome(context);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: buttonChange ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius:
                                  BorderRadius.circular(buttonChange ? 50 : 5)),
                          child: buttonChange
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
