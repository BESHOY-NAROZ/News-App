import 'package:a_m_news_app/bloc/news_cubit.dart';
import 'package:a_m_news_app/bloc/news_states.dart';
import 'package:a_m_news_app/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit objectNewsCubit = NewsCubit.getNewsCubit(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('NewApp'),
            actions: <Widget>[
              IconButton(
                  iconSize: 35,
                  icon: Icon(
                    Icons.search,
                    color: Colors.deepOrangeAccent,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ),
                    );
                  })
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.lightBlueAccent,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrangeAccent,
              currentIndex: objectNewsCubit.index,
              onTap: (current) {
                objectNewsCubit.changeBottomNavPage(current);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), title: Text('Business')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.directions_run), title: Text('Sport')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.book), title: Text('Science')),
              ]),
          body: objectNewsCubit.listOfScreens[objectNewsCubit.index],
        );
      },
    );
  }
}
