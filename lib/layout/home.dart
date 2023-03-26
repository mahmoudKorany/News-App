import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/app_cubit.dart';
import 'package:news/layout/cubit/news_cubit.dart';
import 'package:news/layout/cubit/states.dart';
import '../modules/search_screen/search_screen.dart';
class NewsHome extends StatelessWidget
{
  const NewsHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {},
      builder: (context,state)=> Scaffold(
        appBar: AppBar(
          title: const Text(
            'News',
          ),
          actions:
          [
            IconButton(
                onPressed: ()
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> const SearchScreen()
                      ));
                },
                icon: const Icon(
                  Icons.search,
                )
            ),
            IconButton(
                onPressed: ()
                {
                  AppCubit.get(context).changeMode();
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
                )
            ),
          ],
        ),
        body: NewsCubit.get(context).screens(context),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: NewsCubit.get(context).currentIndex,
          onTap: (index)
          {
            NewsCubit.get(context).changeBottomNavBar(index: index);
          },
          items : NewsCubit.get(context).items,
        ),
      ),
    );
  }
}
