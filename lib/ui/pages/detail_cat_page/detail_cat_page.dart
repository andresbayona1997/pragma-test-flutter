import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pragma/ui/pages/detail_cat_page/detail_cat_page_bloc.dart';
import 'package:flutter_pragma/ui/pages/webview_page.dart';

import '../../styles/colors.dart';
import '../../styles/text_styles.dart';
import '../../widgets/AppBarWidget.dart';

class DetailCatPage extends StatefulWidget{
  const DetailCatPage({super.key});

  @override
  State<StatefulWidget> createState() => _DetailCatState();
}

class _DetailCatState extends State<DetailCatPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
    ));
    return MultiBlocProvider(
      providers: [BlocProvider(
        create: (context) => DetailCatPageBloc()..add(LoadPhotoInfo()),
      )],
      child: const Column(
        children: [
          DetailedCat()
        ],
      ),);
  }
}

class DetailedCat extends StatelessWidget {
  const DetailedCat({super.key});


  @override
  Widget build(BuildContext context) {
    String countryCode ="";
    return Expanded(
      child: Scaffold(
        body: Center(
          child: BlocBuilder<DetailCatPageBloc, DetailCatPageState>(
            builder: (BuildContext context, DetailCatPageState state) {
              if (state is DetailCatPageInitial) {
                return CircularProgressIndicator(color: ColorsApp.mainPurple,);
              }
              if (state is DetailCatPageLoaded) {
                countryCode = state.catInfo.countryCode;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppBarWidget(),
                    SizedBox(height: 15,),
                    Container(
                      child: CarouselSlider(
                        items: state.photos.map((item) =>
                        Container(
                          child: Center(
                            child: Image.network(item),
                          ),
                        )).toList(),
                        options: CarouselOptions(
                        autoPlay: true,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          aspectRatio: 2.0

                      ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(state.catInfo.name,
                      style: TextStyles.mainTitlePurple,),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ListView(
                          children: <Widget>[
                            Text('Description :',
                            style: TextStyles.mainTitlePurple,),
                            Text(state.catInfo.description,
                              style: TextStyles.mainSubTextBlack,),
                            Text('Temperament :',
                              style: TextStyles.mainTitlePurple,),
                            Text(state.catInfo.temperament,
                                style: TextStyles.mainSubTextBlack),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Text('Origin: ',
                                  style: TextStyles.mainTitlePurple,),
                                Image.network('https://flagsapi.com/$countryCode/flat/64.png',
                                  height: 40,)
                              ],
                            ),
                            SizedBox(width: 40,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Lifespan :',
                                    textAlign: TextAlign.center,
                                    style: TextStyles.mainSubTextBlack,),
                                    Row(
                                      children: [
                                        Text(state.catInfo.lifeSpan,
                                        style: TextStyles.mainTitlePurple.copyWith(fontSize: 30),),
                                        Text('  years',
                                          textAlign: TextAlign.center,
                                          style: TextStyles.mainSubTextBlack,),
                                      ],
                                    ),

                                  ],
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Weight :',
                                      textAlign: TextAlign.center,
                                      style: TextStyles.mainSubTextBlack,),
                                    Row(
                                      children: [
                                        Text(state.catInfo.weight,
                                            style: TextStyles.mainTitlePurple.copyWith(fontSize: 30)),
                                        Text('  pounds',
                                          textAlign: TextAlign.center,
                                          style: TextStyles.mainSubTextBlack,),
                                      ],
                                    ),

                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Adaptability ',
                                style: TextStyles.mainTitlePurple,),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 160
                                  ),
                                    child: RatingSpecs(state.catInfo.adaptability)),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Affection ',
                                  style: TextStyles.mainTitlePurple,),
                                Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 160
                                    ),
                                    child: RatingSpecs(state.catInfo.affectionLevel)),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Child friendly ',
                                  style: TextStyles.mainTitlePurple,),
                                Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 160
                                    ),
                                    child: RatingSpecs(state.catInfo.childFriendly)),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Dog friendly ',
                                  style: TextStyles.mainTitlePurple,),
                                Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 160
                                    ),
                                    child: RatingSpecs(state.catInfo.dogFriendly)),
                              ],),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text('Energy ',
                          style: TextStyles.mainTitlePurple,),
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: 160
                          ),
                          child: RatingSpecs(state.catInfo.energyLevel),
                        )]),
                            SizedBox(height: 20,),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Intelligence ',
                                    style: TextStyles.mainTitlePurple,),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 160
                                    ),
                                    child: RatingSpecs(state.catInfo.intelligence),
                                  )]),
                            SizedBox(height: 20,),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Social needs ',
                                    style: TextStyles.mainTitlePurple,),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 160
                                    ),
                                    child: RatingSpecs(state.catInfo.socialNeeds),
                                  )]),
                            SizedBox(height: 20,),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Stranger friendly ',
                                    style: TextStyles.mainTitlePurple,),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 160
                                    ),
                                    child: RatingSpecs(state.catInfo.strangerFriendly),
                                  )]),
                            SizedBox(height: 20,),
                            state.catInfo.moreInfo!=""?GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>  WebViewPage(url: state.catInfo.moreInfo), // Replace MainPage with your main screen
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                  color: ColorsApp.mainPurple
                                ),
                                child: Text('Wikipedia',
                                style: TextStyles.mainTitleWhite,),
                              ),
                            ):Container()
                          ],
                        ),
                      ),
                    ),

                  ],
                );
              }
              else{
                return Container();
              }
            })
        ),
      ),
    );
  }

}

Widget RatingSpecs(num spec){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Icon(Icons.circle,
      size: 25,
      color: spec>0?Colors.cyanAccent:Colors.grey,),
      Icon(Icons.circle,
        size: 25,
        color: spec>1?Colors.cyanAccent:Colors.grey,),
      Icon(Icons.circle,
        size: 25,
        color: spec>2?Colors.cyanAccent:Colors.grey,),
      Icon(Icons.circle,
        size: 25,
        color: spec>3?Colors.cyanAccent:Colors.grey,),
      Icon(Icons.circle,
        size: 25,
        color: spec>4?Colors.cyanAccent:Colors.grey,),

    ],
  );
}