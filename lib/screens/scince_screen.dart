import 'package:a_m_news_app/bloc/news_cubit.dart';
import 'package:a_m_news_app/bloc/news_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main_widget.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        NewsCubit objectNewsCubit = NewsCubit.getNewsCubit(context);
        var list = objectNewsCubit.scienceList;
        return MainWidget(list);
      },
    );
  }
}
