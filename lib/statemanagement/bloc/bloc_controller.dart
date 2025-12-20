import 'package:flutter_bloc/flutter_bloc.dart';

class BlocController extends Cubit<String> {
  BlocController(super.initialState);

  void onSelectDropdown(String value) => emit(value+value);
}
