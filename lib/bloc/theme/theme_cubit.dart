import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeInitial(true));
  void setTheme(bool isSwitched){ emit(ThemeInitial(isSwitched));}
}