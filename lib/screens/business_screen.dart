import 'package:a_m_news_app/bloc/news_cubit.dart';
import 'package:a_m_news_app/bloc/news_states.dart';
import 'package:a_m_news_app/main_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        NewsCubit objectNewsCubit = NewsCubit.getNewsCubit(context);
        var list = objectNewsCubit.businessList;
        return MainWidget(list);
      },
    );
  }
}
