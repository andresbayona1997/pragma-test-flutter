
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pragma/data/models/cat_info_model.dart';
import 'package:flutter_pragma/ui/pages/detail_cat_page/detail_cat_page.dart';
import 'package:flutter_pragma/ui/pages/search_page/search_page_bloc.dart';
import 'package:flutter_pragma/ui/pages/search_page/search_page_event.dart';
import 'package:flutter_pragma/ui/styles/colors.dart';
import 'package:flutter_pragma/ui/styles/text_styles.dart';
import 'package:flutter_pragma/ui/widgets/AppBarWidget.dart';

class SearchPage extends StatefulWidget{
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    ));
    return MultiBlocProvider(
        providers: [BlocProvider(
          create: (context) => SearchPageBloc()..add(LoadCatsInfo()),
        )],
      child: const Column(
        children: [
          SearchScreen()
        ],
      ),);
  }
}

class SearchScreen extends StatelessWidget{
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController _controller = new TextEditingController();
    List<CatInfoModel> filteredCats = [];
    bool affection = false;
    bool social = false;
    bool hypoallergenic = false;
    bool dogFriendly = false;

    return Expanded(
      child: Scaffold(
        body: Center(
          child: BlocBuilder<SearchPageBloc, SearchPageState>(
            builder: (BuildContext context, SearchPageState state) {
              if(state is SearchPageInitial){
                return CircularProgressIndicator( color: ColorsApp.mainPurple,);
              }
              if(state is SearchPageLoaded){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppBarWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: 'Filter by name..',
                                hintStyle: TextStyle(color: Colors.black,
                                fontSize: 18),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: GestureDetector(
                                    onTap: (){
                                      //filteredStates = states;
                                    },
                                    child: Hero(
                                      tag: 'search',
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFC7C3EC),
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Icon(Icons.search,
                                          key: Key('search'),
                                          color: Color(0xFF271C7C),
                                          size: 25,),
                                      ),
                                    ),
                                  ),
                                ),
                                ),
                                onChanged: (text){
                                state.filter= _controller.text;
                                  context.read<SearchPageBloc>().add(SearchCatInfo());
                                },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        GestureDetector(
                          onTap: (){
                            showDialog(context: context, builder: (BuildContext c){
                              return Dialog(
                                child: Container(
                                  constraints: BoxConstraints(maxHeight: 400),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(width: 5,),
                                            Text('Aditional Filters',
                                            style: TextStyles.mainTitlePurple,
                                            textAlign: TextAlign.center,),
                                            GestureDetector(
                                              onTap: (){
                                                Navigator.pop(c);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                child: Icon(Icons.cancel_outlined,
                                                color: ColorsApp.mainPurple,
                                                size: 30,),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 15,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Affective',
                                            style: TextStyles.mainSubTextBlack,),
                                            SizedBox(width: 8,),
                                            Switch(value: affection,
                                                onChanged: (value)  {
                                                  affection = !affection;
                                                  (c as Element).markNeedsBuild();
                                                },
                                            activeColor: ColorsApp.mainPurple,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Social',
                                              style: TextStyles.mainSubTextBlack,),
                                            SizedBox(width: 8,),
                                            Switch(value: social,
                                                activeColor: ColorsApp.mainPurple,
                                              onChanged: (value)  {
                                                social = !social;
                                                (c as Element).markNeedsBuild();
                                              },),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Hypoallergenic',
                                              style: TextStyles.mainSubTextBlack,),
                                            SizedBox(width: 8,),
                                            Switch(value: hypoallergenic,
                                                activeColor: ColorsApp.mainPurple,
                                              onChanged: (value)  {
                                                hypoallergenic = !hypoallergenic;
                                                (c as Element).markNeedsBuild();
                                              },),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Dog friendly',
                                              style: TextStyles.mainSubTextBlack,),
                                            SizedBox(width: 8,),
                                            Switch(value: dogFriendly,
                                                activeColor: ColorsApp.mainPurple,
                                              onChanged: (value)  {
                                                dogFriendly = !dogFriendly;
                                                (c as Element).markNeedsBuild();
                                              },),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(width: 10,),
                                            GestureDetector(
                                              onTap: (){
                                                if(social || affection || dogFriendly || hypoallergenic){
                                                  state.activeFilter = true;
                                                }else{
                                                  state.activeFilter = false;
                                                }
                                                state.social = social;
                                                state.affection = affection;
                                                state.dogFriendly = dogFriendly;
                                                state.hypoallergenic = hypoallergenic;
                                                context.read<SearchPageBloc>().add(filterBySpecs());
                                                Navigator.pop(c);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Text('Apply',
                                                style: TextStyles.mainButtonTextOk,),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: state.activeFilter?ColorsApp.mainPurple:Colors.white,
                              border: Border.all(color: ColorsApp.mainPurple,
                              width: 1)
                            ),
                            child: Icon(
                              state.activeFilter?Icons.account_tree:Icons.account_tree_outlined,
                              color: state.activeFilter?Colors.white:ColorsApp.mainPurple,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          ...state.cats.map((cat){
                            return GestureDetector(
                              onTap: (){
                                state.selectedCat = cat;
                                context.read<SearchPageBloc>().add((SelectCatInfo()));
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const DetailCatPage(), // Replace MainPage with your main screen
                                  ),
                                );
                              },
                                child: CatCard(cat, _controller, state));
                          })
                        ],
                      ),
                    )
                  ],
                );
              }else{
                return Text('Error pai', style: TextStyles.mainTitlePurple,);
              }
            },)
        ),
      ),
    );
  }


}


Widget CatCard(CatInfoModel cat, TextEditingController controller, SearchPageState stateCat){
   bool medalsAffection = false;
   bool medalEnergy = false;
   bool medalAdaptability = false;
   if(cat.affectionLevel == 5){
     medalsAffection = true;
   }
   if(cat.energyLevel == 5){
     medalEnergy = true;
   }
   if(cat.adaptability == 5){
     medalAdaptability = true;
   }

    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(
            color: ColorsApp.mainBackground.withOpacity(0.2),
            offset: const Offset(
              5.0,
              5.0,
            ),
            spreadRadius: 2.0,
          )],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: CachedNetworkImage(
                    imageUrl: cat.photoUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      constraints: const BoxConstraints(maxHeight: 150, maxWidth: 150),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) => new CircularProgressIndicator(color: ColorsApp.mainPurple,),
                    errorWidget: (context,url, error) => new Container(),
                  ),
                ),
              ),
              Flexible(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 5),
                  child: Column(
                    children: [
                      Text(cat.name,
                        style: TextStyles.mainTitlePurple,),
                      Text("Temperament: "+cat.temperament,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.favorite,
                                size: 30,
                                color: medalsAffection?Colors.red:Colors.grey,),
                                Text('Affect',
                                style: TextStyle(
                                  fontSize: 10
                                ),)
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.battery_charging_full_rounded,
                                  size: 30,
                                  color: medalEnergy?Colors.yellow:Colors.grey,),
                                Text('Energy',
                                    style: TextStyle(
                                        fontSize: 10
                                    ))
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.autorenew,
                                  size: 30,
                                  color: medalAdaptability?Colors.green:Colors.grey,),
                                Text('Adapt',
                                    style: TextStyle(
                                        fontSize: 10
                                    ))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsApp.mainBackground
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text('More info',
                  style: TextStyles.mainButtonTextOk.copyWith(fontSize: 14),),
                ),
              ],
            ),
          )
        ],
      ),
    );
}

