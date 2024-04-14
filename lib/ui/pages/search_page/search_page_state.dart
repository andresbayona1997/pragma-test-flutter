part of 'search_page_bloc.dart';

@immutable
sealed class SearchPageState extends Equatable{
  const SearchPageState();

  @override
  List<Object?> get props => [];
}

final class SearchPageInitial extends SearchPageState {


}

class SearchPageLoaded extends SearchPageState{
    List<CatInfoModel> cats;
    CatInfoModel selectedCat;
    String filter;
    bool activeFilter;
    bool affection ;
    bool social ;
    bool hypoallergenic ;
    bool dogFriendly ;

    SearchPageLoaded({
      required this.cats,
      required this.filter,
      required this.activeFilter,
      required this.affection,
      required this.social,
      required this.hypoallergenic,
      required this.dogFriendly,
      required this.selectedCat});

    @override
    List<Object> get props => [cats];
}
