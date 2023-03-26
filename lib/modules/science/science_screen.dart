import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/news_cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/shared/components/component.dart';

Widget scienceScreen(context)
{
  List<dynamic> map = NewsCubit.get(context).science;
  return BlocConsumer<NewsCubit,NewsStates>(
    listener: (BuildContext context, Object? state) {},
    builder: (BuildContext context, state) =>ConditionalBuilder(
      condition: map.isEmpty,
      builder: (BuildContext context) =>  Center(child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      )),
      fallback: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context,index) {
          return newsItem(
              context,
              news: map[index],
              type: 'science',
              index: index
          );
        },
        separatorBuilder: (context,index) => Container(
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          width: double.infinity,
          height: 1,
          color: Theme.of(context).primaryColor,
        ),
        itemCount: map.length,
      ),
    ),

  );
}
