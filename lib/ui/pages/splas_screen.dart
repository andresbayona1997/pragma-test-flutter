import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pragma/ui/styles/colors.dart';
import 'package:flutter_pragma/ui/styles/text_styles.dart';

class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.mainBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pragma",
            style: TextStyles.mainTitlePurple,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Image.network('https://cdn2.thecatapi.com/images/cZHbIzC_l.jpg'),
            )
          ],
        ),
      ),
    );
  }

}