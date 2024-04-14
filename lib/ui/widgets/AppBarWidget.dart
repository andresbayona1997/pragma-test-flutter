import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pragma/ui/styles/colors.dart';
import 'package:flutter_pragma/ui/styles/text_styles.dart';

class AppBarWidget extends StatelessWidget{
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsApp.mainBackground,
      title: Text('Pragma Catbreeds',
      style: TextStyles.mainTitleWhite,),
      iconTheme: IconThemeData(
        color: Colors.white
      ),
    );
  }

}