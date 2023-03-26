import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/news_cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/shared/components/component.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state)
      {
        List<dynamic> map = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Container(
                  padding: const EdgeInsetsDirectional.only(
                    top: 20.0,
                    start: 20.0,
                    end: 20.0,
                  ),
                  height: 100.0,
                  width: double.infinity,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      NewsCubit.get(context).getDataSearch(value);
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label:Text(
                        'search',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
              ),
              Expanded(
                child: Center(
                  child: ConditionalBuilder(
                    condition: map.isNotEmpty,
                    fallback: (BuildContext context) => Container(),
                    builder: (BuildContext context) => ListView.separated(
                      itemBuilder: (context, index) => newsItem(
                        context,
                        news: map[index],
                        index: index,
                        type: 'search',
                      ),
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 15.0,
                        ),
                        child: Container(
                          color: Theme.of(context).primaryColor,
                          height: 1,
                        ),
                      ),
                      itemCount: map.length,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

