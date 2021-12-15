import 'package:a_m_news_app/bloc/news_cubit.dart';
import 'package:a_m_news_app/bloc/news_states.dart';
import 'package:a_m_news_app/main_widget.dart';
import 'package:a_m_news_app/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        NewsCubit newsCubit = NewsCubit.getNewsCubit(context);
        var list = newsCubit.searchList;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                DefaultTextForm(
                  icon: Icon(Icons.search),
                  hintText: 'Search',
                  controller: newsCubit.searchController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return ('Type Here');
                    }
                    return null;
                  },
                  onChanged: (value) async {
                    await newsCubit.getSearchData(value: value);
                  },
                ),
                Expanded(
                  child: MainWidget(list),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
