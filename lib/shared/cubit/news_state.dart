part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class changeBottomNavigation extends NewsState {}

class getSportsSuccessState extends NewsState {}

class sportsloadingState extends NewsState {}

class getSportsErrorState extends NewsState {
  final String error;

  getSportsErrorState(this.error);
}


class getBusinessSuccessState extends NewsState {}

class businessloadingState extends NewsState {}

class getBusinessErrorState extends NewsState {
  final String error;

  getBusinessErrorState(this.error);
}

class getScienceSuccessState extends NewsState {}

class scienceloadingState extends NewsState {}

class getScienceErrorState extends NewsState {
  final String error;

  getScienceErrorState(this.error);
}

class getPoliticsSuccessState extends NewsState {}

class politicsloadingState extends NewsState {}

class getPoliticsErrorState extends NewsState {
  final String error;

  getPoliticsErrorState(this.error);
}

class getSearchSuccessState extends NewsState {}

class searchloadingState extends NewsState {}

class getSearchErrorState extends NewsState {
  final String error;

  getSearchErrorState(this.error);
}

class changeIconMode extends NewsState {}
