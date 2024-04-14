
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pragma/ui/pages/search_page/search_page_event.dart';

import '../../../data/managers/cat_info_manager.dart';
import '../../../data/models/cat_info_model.dart';
part 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  final _catApi = CatInfoManager.get;
  List<CatInfoModel> catsInitial = [];
  bool filterActive = false;
  bool affection = false;
  bool social = false;
  bool hypoallergenic = false;
  bool dogFriendly = false;
  late CatInfoModel selectedCat;

  SearchPageBloc() : super(SearchPageInitial()) {
    on<LoadCatsInfo>(
        (event, emit) async{
          catsInitial = await _catApi.getAllCatInfo();
          selectedCat = catsInitial.first;
          emit(SearchPageLoaded(
              cats: catsInitial,
              filter: "",
              activeFilter: filterActive,
              social: social,
              affection: affection,
              dogFriendly: dogFriendly,
              hypoallergenic: hypoallergenic,
              selectedCat: selectedCat));
        }
    );
    on<SearchCatInfo>(
        (event, emit) {
          if(state is SearchPageLoaded){
            final state = this.state as SearchPageLoaded;
            if(state.filter!=""){
              List<CatInfoModel> catsFiltered = [];
             for(var i = 0; i < state.cats.length; i++){
               CatInfoModel catFilter = state.cats[i];
               if(catFilter.name.toLowerCase().contains(state.filter.toLowerCase())){
                 catsFiltered.add(catFilter);
               }
             }
              emit(
                  SearchPageLoaded(
                      cats: catsFiltered,
                      filter: "",
                      activeFilter: state.activeFilter,
                      hypoallergenic: state.hypoallergenic,
                      dogFriendly: state.dogFriendly,
                      affection: state.affection,
                      social: state.social,
                      selectedCat: selectedCat
                  )
              );
            }else{
              emit(
                  SearchPageLoaded(
                      cats: catsInitial,
                      filter: "",
                      activeFilter: state.activeFilter,
                      hypoallergenic: state.hypoallergenic,
                      dogFriendly: state.dogFriendly,
                      affection: state.affection,
                      social: state.social,
                      selectedCat: selectedCat
                  ));
            }

          }
        }
    );
    on<SelectCatInfo>((event,emit) {
      if(state is SearchPageLoaded){
        final state = this.state as SearchPageLoaded;
        _catApi.selectedCat = state.selectedCat;
      }
    });
    on<filterBySpecs>((event, emit) {
      if(state is SearchPageLoaded){
        final state = this.state as SearchPageLoaded;
        List<CatInfoModel> catsFiltered = [];
        if(state.hypoallergenic){
          for(int i = 0; i< state.cats.length; i++){
            if(state.cats[i].hypoallergenic == true ){
              catsFiltered.add(state.cats[i]);
            }
          }
        }
        if(state.dogFriendly){
          for(int i = 0; i< state.cats.length; i++){
            if(state.cats[i].dogFriendly >3 ){
              catsFiltered.add(state.cats[i]);
            }
          }
        }
        if(state.affection){
          for(int i = 0; i< state.cats.length; i++){
            if(state.cats[i].affectionLevel >3 ){
              catsFiltered.add(state.cats[i]);
            }
          }
        }
        if(state.social){
          for(int i = 0; i< state.cats.length; i++){
            if(state.cats[i].socialNeeds >3 ){
              catsFiltered.add(state.cats[i]);
            }
          }
        }
        if(state.social || state.affection || state.dogFriendly || state.hypoallergenic){
          emit(
              SearchPageLoaded(
                  cats: catsFiltered,
                  filter: "",
                  activeFilter: state.activeFilter,
                  hypoallergenic: state.hypoallergenic,
                  dogFriendly: state.dogFriendly,
                  affection: state.affection,
                  social: state.social,
                  selectedCat: selectedCat
              )
          );
        }else{
          emit(
              SearchPageLoaded(
                  cats: catsInitial,
                  filter: "",
                  activeFilter: state.activeFilter,
                  hypoallergenic: state.hypoallergenic,
                  dogFriendly: state.dogFriendly,
                  affection: state.affection,
                  social: state.social,
                  selectedCat: selectedCat
              )
          );
        }

      }
    });
  }
}
