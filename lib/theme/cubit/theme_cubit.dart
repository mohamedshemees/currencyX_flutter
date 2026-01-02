import 'package:bloc/bloc.dart';
import 'package:currencyx/domain/AppThemeRepository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  AppThemeRepository appThemeRepository;
  ThemeCubit(this.appThemeRepository) : super(ThemeInitial()){
    getTheme();
  }
  void getTheme() async {
    var newMode = await appThemeRepository.getAppTheme();
    if(newMode== "DARK"){
      emit(ThemeDark());
    }else if(newMode=="LIGHT"){
      emit(ThemeLight());
    }else{
      emit(ThemeInitial());
    }
  }
  void setTheme(String theme) async {
    appThemeRepository.setAppTheme(theme);
    getTheme();
  }

}

