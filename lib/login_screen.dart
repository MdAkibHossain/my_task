import 'package:flutter/material.dart';
import 'package:my_task/home_page.dart';
import 'package:provider/provider.dart';

import 'provider/get_data_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHight = MediaQuery.of(context).size.height;
    final double screenWidht = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
              width: screenWidht,
              height: screenHight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/back.png'),
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
              top: screenWidht * 0.2,
              left: screenWidht * 0.07,
              child: Text(
                "Find your best \nComfort Place",
                style: TextStyle(
                    fontSize: 44, color: Color.fromRGBO(50, 34, 21, 1)),
              )),
          Positioned(
              top: screenWidht * 0.6,
              left: screenWidht * 0.07,
              child: Text(
                "Post your requirements and get highly relevant\nmatches with your need.",
                style: TextStyle(color: Color.fromRGBO(43, 34, 27, 1)),
              )),
          Positioned(
              bottom: screenWidht * 0.2,
              left: screenWidht * 0.05,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: InkWell(
                  onTap: () async {
                    await Provider.of<GetDataProvider>(context, listen: false)
                        .getDataProvider()
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage())));
                  },
                  child: Container(
                    height: screenHight * 0.09,
                    width: screenHight * 0.45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/google.png',
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: screenWidht * 0.03,
                        ),
                        Text("Sign in with Google"),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.all(Radius.circular(1)),
                    ),
                  ),
                ),
              )),
          Positioned(
              bottom: screenWidht * 0.15,
              left: screenWidht * 0.2,
              child: Text(
                "Dont have account? Register here",
                style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
              )),
        ],
      ),
    ));
  }
}
