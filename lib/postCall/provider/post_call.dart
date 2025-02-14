import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//Post request class
class Postcall extends ChangeNotifier {
  //Define a variable to return sent data body
  var response;
  void postCall() async {
    //Exception handlind
    try {
      log('sending Data');
      //Created a var to store request sending data
      var sentData = await http.post(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          //Ensuring that data always in JSON format to avoid unexpected result
          headers: {"Content-Type": "application/json"},
          //Used encode method for clarities sake
          body: jsonEncode([
            {
              "Username": "Khaksar89",
              "Password": "123xxxx",
              "Title": "Professor",
              "Hair": {"Color": "Brown", "Type": "Curly"},
            },
            {
              "Username": "Jordan",
              "Password": "123xxxx",
              "Title": "QA Eng",
              "Hair": {"Color": "Black", "Type": "Silky"},
            },

          ]));
          //Utilize upper defined var for send Data body
      response = sentData.body;
      log("Send Data statuscode: ${sentData.statusCode}");
      log("Response: $response");
    } catch (e) {
      log('Exception: $e');
    }
    //Don't forget to write this triggering method
    notifyListeners();
  }
}
