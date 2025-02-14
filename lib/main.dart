import 'package:api_practice/postCall/provider/post_call.dart';
import 'package:api_practice/postCall/provider/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

//main function
void main() => runApp(
        //Global class of project
        ChangeNotifierProvider<Postcall>(
      //context of Post request class
      create: (_) => Postcall(),
      child: const MyApp(),
    ));

//MyApp class basic class
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Using Scheduler binding for calling post request class and avoid rendring exceptions
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
        //Given context of Postcall class
        (_) => Provider.of<Postcall>(context, listen: false).postCall());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //Decorating globally all UI Widgets using in project
        theme: ThemeData(
            progressIndicatorTheme:
                ProgressIndicatorThemeData(color: Colors.blue[300]),
            scaffoldBackgroundColor: Colors.white,
            //Appbar detailing
            appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromARGB(255, 95, 167, 227),
                centerTitle: true,
                elevation: 15),
            //List tile detailing
            listTileTheme: ListTileThemeData(
                shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black, width: 0.5)),
                tileColor: Colors.blue[300])),
        //Calling PostScreen class for UI
        home: const PostScreen());
  }
}