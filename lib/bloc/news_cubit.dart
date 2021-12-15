import 'package:a_m_news_app/bloc/news_states.dart';
import 'package:a_m_news_app/new_dio.dart';
import 'package:a_m_news_app/screens/business_screen.dart';
import 'package:a_m_news_app/screens/scince_screen.dart';
import 'package:a_m_news_app/screens/sport_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  TextEditingController searchController = TextEditingController();

  static NewsCubit getNewsCubit(context) => BlocProvider.of(context);

  int index = 0;
  changeBottomNavPage(int currentIndex) {
    index = currentIndex;
    emit(NewsBottomNavState());
  }

  List<Widget> listOfScreens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  List<dynamic> businessList = [];

  getBusinessData() async {
    Response<dynamic> data = await NewsDio.dioGetData(
      'v2/top-headlines',
      {
        'country': 'eg',
        'category': 'business',
        'apiKey': '5349b2c85c814359a7de0b52139861ba',
      },
    );
    emit(NewsGetBusinessState());
    businessList = await data.data['articles'];
  }

  List<dynamic> sportsList = [];

  getSportsData() async {
    Response<dynamic> data = await NewsDio.dioGetData(
      'v2/top-headlines',
      {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '5349b2c85c814359a7de0b52139861ba',
      },
    );
    emit(NewsGetSportsState());
    sportsList = await data.data['articles'];
  }

  List<dynamic> scienceList = [];

  getScienceData() async {
    Response<dynamic> data = await NewsDio.dioGetData(
      'v2/top-headlines',
      {
        'country': 'eg',
        'category': 'science',
        'apiKey': '5349b2c85c814359a7de0b52139861ba',
      },
    );
    emit(NewsGetScienceState());
    scienceList = await data.data['articles'];
  }

  List<dynamic> searchList = [];

  getSearchData({String value}) async {
    // https://newsapi.org/v2/everything?q=tesla&apiKey=5349b2c85c814359a7de0b52139861ba
    Response<dynamic> data = await NewsDio.dioGetData(
      'v2/everything',
      {
        'q': '$value',
        'apiKey': '5349b2c85c814359a7de0b52139861ba',
      },
    );
    searchList = await data.data['articles'];
    emit(NewsGetSearchState());
  }
}
