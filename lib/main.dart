import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/cubit/app_cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/remote/local.dart';
import 'package:news/remote/network.dart';
import 'package:news/shared/constants/constants.dart';
import 'layout/cubit/news_cubit.dart';
import 'layout/home.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.get();
  await CacheHelper.init();
  dynamic isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  const MyApp(this.isDark, {super.key});
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers:
      [
        BlocProvider(create:(BuildContext context) => NewsCubit()..getBusinessData(), ),
        BlocProvider(create: (BuildContext context) => AppCubit()..changeMode(isDark: isDark),),
      ],
      child: BlocConsumer<AppCubit,NewsStates>(
        listener: (context,state) => {},
        builder: (context,stata) =>  MaterialApp(
          theme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              elevation: 0.0,
              backgroundColor: Colors.white,
              selectedItemColor: themeColor,
              unselectedItemColor:Colors.black,
            ),
            scaffoldBackgroundColor : Colors.white,
            primaryColor: themeColor,
            appBarTheme:  AppBarTheme(
                titleSpacing: 20.0,
                iconTheme: IconThemeData(
                  color: themeColor,
                ),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: themeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )
            ),
            textTheme: const TextTheme(
              bodyText1: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          darkTheme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              elevation: 0.0,
              backgroundColor: HexColor('333739'),
              selectedItemColor: themeColor,
              unselectedItemColor:Colors.white,
            ),
            scaffoldBackgroundColor : HexColor('333739'),
            primaryColor: themeColor,
            appBarTheme:  AppBarTheme(
                titleSpacing: 20.0,
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                systemOverlayStyle:  SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )
            ),
            textTheme: const TextTheme(
              bodyText1: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
              ),
            ),
          ),
          themeMode: AppCubit.get(context).isDarkMode ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: const NewsHome(),
        ),
      ),
    );
  }
}
