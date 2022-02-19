import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarCubit extends Cubit<double> {
  AppBarCubit() : super(0);
  void seOffset(double offset) => emit(offset);
}
