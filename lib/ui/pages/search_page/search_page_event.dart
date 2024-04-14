
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
sealed class SearchPageEvent extends Equatable{
  const SearchPageEvent();

  @override
  List<Object?> get props => [];
}

class LoadCatsInfo extends SearchPageEvent{
}

class SearchCatInfo extends SearchPageEvent{

}

class filterBySpecs extends SearchPageEvent{

}

class SelectCatInfo extends SearchPageEvent{

}