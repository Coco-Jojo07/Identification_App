import 'package:flutter/material.dart';
import 'package:identification/screens/modif_screen.dart';
import 'package:identification/screens/register_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 7), () {
      method();
    });
  }

  void method() async {
// Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    int counter = prefs.getInt('counter') ?? 0;

    counter++;

    await prefs.setInt('counter', counter);

    print(counter);

    navigateHome(counter == 1);
  }

  void navigateHome(bool firstNav) {
    if (firstNav) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InfoScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(right: 8),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset(
                  "assets/icons/2lion.png",
                  width: 190,
                ),
              ),
              SizedBox(
                child: Text(
                  "MSPC",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CircularProgressIndicator(
                color: Color.fromARGB(255, 10, 121, 45),
                backgroundColor: Color.fromARGB(105, 244, 67, 54),
              ), 
            ],
          ),
        ),
      ),
    );
  }
}
