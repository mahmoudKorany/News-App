import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/remote/network.dart';
import '../../modules/business/business_screen.dart';
import '../../modules/science/science_screen.dart';
import '../../modules/sports/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context)=> BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label: 'Science')
  ];
  Widget screens(context)
  {
    List<Widget> screens = [
      businessScreen(context),
      sportsScreen(context),
      scienceScreen(context),
    ];
    return screens[currentIndex];
  }

   void changeBottomNavBar({
  required int index,
}) {
     currentIndex = index;
     if(currentIndex ==1)
     {
       emit(Get());
       getSportsData();
     }else
     {
       emit(Get());
       getScienceData();
     }
     emit(ChangeBottomNavBar());
   }

List<dynamic> business = [];
   void getBusinessData()
   {
     emit(GetBusinessDataLoading());
     DioHelper.getData(
         url: 'v2/top-headlines',
         query: {
           'country':'eg',
           'category':'business',
           'apiKey':'14ea9825bca44ef8bfaa37a0af0df5ba',
         }).then((value)
     {
       business = value.data['articles'];
       emit(GetBusinessDataSuccess());
     }).catchError((error)
     {
       emit(GetBusinessDataError(error));
     });
   }
  List<dynamic> sports = [];
  void getSportsData()
  {
    emit(GetSportsDataLoading());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sport',
          'apiKey':'14ea9825bca44ef8bfaa37a0af0df5ba',
        }).then((value)
    {
      sports = value.data['articles'];
      emit(GetSportsDataSuccess());
    }).catchError((error)
    {
      emit(GetSportsDataError(error));
    });
  }

  List<dynamic> science = [];
  void getScienceData()
  {
    emit(GetScienceDataLoading());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'14ea9825bca44ef8bfaa37a0af0df5ba',
        }).then((value)
    {
      science = value.data['articles'];
      emit(GetScienceDataSuccess());
    }).catchError((error)
    {
      emit(GetScienceDataError(error));
    });
  }

  List<dynamic> search = [];

  void getDataSearch(String searchData)
  {
    search = [];
    emit(GetSearchDataLoading());
   if(search.isEmpty)
   {
     DioHelper.getData(
         url: 'v2/top-headlines',
         query: {
           'q': searchData,
           'apikey' : '14ea9825bca44ef8bfaa37a0af0df5ba',
         }).then((value)
     {
       search = value.data['articles'];
       emit(GetSearchDataSuccess());
     }).catchError((error)
     {
       emit(GetSearchDataError(error.toString()));
     });
   }else
   {
     emit(GetSearchDataSuccess());
   }
  }

}