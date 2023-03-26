import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/remote/local.dart';

class AppCubit extends Cubit<NewsStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context)=> BlocProvider.of(context);

  bool isDarkMode = false;

  void changeMode({bool? isDark})
  {
    if(isDark == null)
    {
      isDarkMode = !isDarkMode;
      CacheHelper.setData(key: 'isDark', value: isDarkMode);
      emit(AppChangeModeState());
    }else
    {
      isDarkMode = isDark;
      CacheHelper.setData(key: 'isDark', value: isDarkMode);
      emit(AppChangeModeState());
    }
  }
}