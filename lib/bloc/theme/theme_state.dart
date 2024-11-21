part of 'theme_cubit.dart';


abstract class ThemeState extends Equatable {
  const ThemeState(this.isSwitched);
  final bool isSwitched;
  @override
  List<Object> get props => [isSwitched];
}

class ThemeInitial extends ThemeState{
  const ThemeInitial(bool isSwitched) : super(isSwitched);
}