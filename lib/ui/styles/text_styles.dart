import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pragma/ui/styles/colors.dart';
class TextStyles{
  static final TextStyle mainTitlePurple = TextStyle(
      color: ColorsApp.mainPurple,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  static final TextStyle mainTitleWhite = TextStyle(
    color: Colors.white,
    fontSize: 21,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle mainSubTextBlack = TextStyle(
    color:  Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.normal
  );
  static final TextStyle mainButtonTextOk = TextStyle(
    color:  Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.normal
  );
}