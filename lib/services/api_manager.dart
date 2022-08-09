// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moviesdb/models/user_login_model.dart';
import 'dart:convert';
import '../screens/homescreen.dart';
import '../models/movie_list_model.dart';

class APIManager {
  // Route to Homescreen function
  static void routeToHomescreen(BuildContext buildContext, String token, String firstName) {
    Navigator.push(
      buildContext,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          token: token,
          firstName: firstName,
        ),
      ),
    );
  }

  // Display Snackbar implementation
  static void displaySnackBar(BuildContext buildContext, SnackBar snackBar) {
    ScaffoldMessenger.of(buildContext).showSnackBar(snackBar);
  }

  // Login API implementation
  static Future<dynamic> userLogin(
      BuildContext context, String email, String password) async {
    const url = 'https://api-telly-tell.herokuapp.com/api/client/signin';

    var response = await http.post(
      Uri.parse(url),
      body: {
        'email': email,
        'password': password,
      },
    );
    int status = response.statusCode;

    switch (status) {
      case 201:
        UserLoginModel userLoginData =
            UserLoginModel.fromJson(jsonDecode(response.body));
        routeToHomescreen(context, userLoginData.token, userLoginData.userData.firstName);
        break;

      case 401:
        const snackBar = SnackBar(
          content: Text('Invalid credentials.'),
        );
        displaySnackBar(context, snackBar);
        break;

      default:
        const snackBar = SnackBar(
          content: Text('Something went wrong.'),
        );
        displaySnackBar(context, snackBar);
        break;
    }
  }

  // Registration API implementation
  static Future<dynamic> userRegistration(BuildContext context,
      String firstName, String lastName, String email, String password) async {
    const url = 'https://api-telly-tell.herokuapp.com/api/client/signup';

    var response = await http.post(
      Uri.parse(url),
      body: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      },
    );

    int status = response.statusCode;

    switch (status) {
      case 200:
        const snackBar = SnackBar(
          content: Text('Email is already in use.'),
        );
        displaySnackBar(context, snackBar);
        break;

      case 201:
        const snackBar = SnackBar(
          content: Text(
            'Account created! Now please login.',
          ),
          duration: Duration(
            seconds: 3,
          ),
        );
        displaySnackBar(context, snackBar);
        Navigator.pop(context);
        break;
      default:
        const snackBar = SnackBar(
          content: Text('Something went wrong!'),
        );
        displaySnackBar(context, snackBar);
        break;
    }
  }

  static Future<MovieListModel> fetchMovieList(String token) async {
    const url = 'https://api-telly-tell.herokuapp.com/movies/rahul.verma';

    var response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return MovieListModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Failed to load data');
    }
  }
}
