import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'active_button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit()
      : super(ButtonState(isEnabled: false, buttonColor: Color(0xFF4D4D4D),
  ));

  void updateButtonState(TextEditingController numberController,
      TextEditingController dateController,
      TextEditingController phoneNumberController) {
    bool isEnabled = numberController.text.length == 19 &&
        _isDateValid(dateController.text) &&
        phoneNumberController.text.length == 17;

    emit(ButtonState(
      isEnabled: isEnabled,
      buttonColor: isEnabled ? Color(0xFFFFD600) : Color(0xFF4D4D4D),));
  }

  bool _isDateValid(String date) {
    if (date.length != 5 || date[2] != '/') {
      return false;
    }
    int month;
    int year;

    try {
      month = int.parse(date.substring(0, 2));
      year = int.parse('20' + date.substring(3, 5));
    } catch (e) {
      return false;
    }

    if (month < 1 || month > 12) {
      return false;
    }

    DateTime now = DateTime.now();
    if (year < now.year) {
      return false;
    }
    if (year == now.year && month < now.month) {
      return false;
    }

    return true;
  }


}