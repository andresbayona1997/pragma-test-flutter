import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pragma/ui/styles/colors.dart';
import 'package:flutter_pragma/ui/styles/text_styles.dart';

class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.mainBackground,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Pragma',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Catbreeds',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Image.asset(
                'assets/pink-cat.png',
                width: 200,
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }

}