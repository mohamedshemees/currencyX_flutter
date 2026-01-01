import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  void updateTheme(ThemeMode newMode) {
    if(newMode==ThemeMode.dark){
      emit(ThemeDark());
    }else if(newMode==ThemeMode.light){
      emit(ThemeLight());
    }else{
      emit(ThemeInitial());
    }
  }
}

