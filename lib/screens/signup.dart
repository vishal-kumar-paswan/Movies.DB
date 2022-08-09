import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/api_manager.dart';
import '../constants.dart';

class UserRegistration extends StatelessWidget {
  UserRegistration({Key? key}) : super(key: key);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Constants.backgroundColor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Register now',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Constants.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _firstNameController,
                    style: Constants.inputTextStyle,
                    decoration: Constants.textFeildInputDecoration(
                        CupertinoIcons.textformat, 'First name'),
                    validator: (value) {
                      if (value!.isEmpty) return "First name cannot be empty";
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _lastNameController,
                    style: Constants.inputTextStyle,
                    decoration: Constants.textFeildInputDecoration(
                        CupertinoIcons.textformat, 'Last name'),
                    validator: (value) {
                      if (value!.isEmpty) return "Last name cannot be empty";
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _emailController,
                    style: Constants.inputTextStyle,
                    decoration: Constants.textFeildInputDecoration(
                        Icons.mail_outline, 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) return "Username cannot be empty";
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: Constants.inputTextStyle,
                    decoration: Constants.textFeildInputDecoration(
                        CupertinoIcons.lock_fill, 'Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: (() {
                    APIManager.userRegistration(
                      context,
                      _firstNameController.text,
                      _lastNameController.text,
                      _emailController.text,
                      _passwordController.text,
                    );
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromARGB(255, 27, 3, 115),
                    ),
                    height: 55,
                    width: 170,
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 17,
                          color: Constants.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Closing the keyboard
                        SystemChannels.textInput.invokeMethod('TextInput.hide');

                        // Routing to Login screen
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blue.shade500,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
