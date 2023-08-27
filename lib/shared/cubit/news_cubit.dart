import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nenow/network/remote/dio_helper.dart';

import '../../network/local/cache_helper.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  int ind = 0;

  void changeNavigationButtom(int index)
  {
    ind=index;
    if(index==1)
      getBusiness();
    else if(index==2)
      getScience();
    else if(index==3)
      getPolitics();

    emit(changeBottomNavigation());
  }
  List<dynamic> Sports=[];
  void getSports(){
    emit(sportsloadingState());
    dioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'us',
        'category':'sports',
        'apiKey':'d28085348e5946a29770b5037242dd1e',
      },
    ).then((value){
      Sports=value.data['articles'];
      print(Sports[0]['title']);
      emit(getSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(getSportsErrorState(error.toString()));
    });  }

  List<dynamic> Business=[];
  void getBusiness(){
    emit(businessloadingState());
    dioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'us',
        'category':'business',
        'apiKey':'d28085348e5946a29770b5037242dd1e',
      },
    ).then((value){
      Business=value.data['articles'];
      print(Business[0]['title']);
      emit(getBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(getBusinessErrorState(error.toString()));
    });  }

  List<dynamic> Science=[];
  void getScience(){
    emit(scienceloadingState());
    dioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'us',
        'category':'science',
        'apiKey':'d28085348e5946a29770b5037242dd1e',
      },
    ).then((value){
      Science=value.data['articles'];
      print(Science[0]['title']);
      emit(getScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(getScienceErrorState(error.toString()));
    });  }

  List<dynamic> Politics=[];
  void getPolitics(){
    emit(politicsloadingState());
    dioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'us',
        'category':'politics',
        'apiKey':'d28085348e5946a29770b5037242dd1e',
      },
    ).then((value){
      Politics=value.data['articles'];
      print(Politics[0]['title']);
      emit(getPoliticsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(getPoliticsErrorState(error.toString()));
    });  }

  //search
  List<dynamic> Search=[];
  void getSearch(String value){
    emit(searchloadingState());
    Search=[];
    dioHelper.getData(
      url: 'v2/everything',
      query: {
        'q':'$value',
        'apiKey':'d28085348e5946a29770b5037242dd1e',
      },
    ).then((value){
      Search=value.data['articles'];
      print(Search[0]['title']);
      emit(getSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(getSearchErrorState(error.toString()));
    });  }

  bool changeiconmode=true;
  void iconMode({bool? fromShared}){
    if(fromShared!=null){
      changeiconmode=fromShared;
      emit(changeIconMode());

    }
    else {
      changeiconmode = !changeiconmode;
      CacheHelper.putData(key: 'changeiconmode', value: changeiconmode).then(
              (value) {
            emit(changeIconMode());
          });
    }
  }


}
