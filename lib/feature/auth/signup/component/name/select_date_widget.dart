import 'package:dear_app/Feature/Auth/Signup/view_model/signup_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SelectDateWidget extends StatelessWidget {
  final _signupVM = Get.put(SignUpViewModel());

  final DateTime selectedDate;

  SelectDateWidget({required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return CupertinoDatePicker(
      minimumYear: 1900,
      maximumYear: DateTime.now().year,
      initialDateTime: selectedDate,
      maximumDate: DateTime.now(),
      onDateTimeChanged: (DateTime newDateTime) {
        _signupVM.birthdateController.value.text =
            DateFormat('yyyy-MM-dd').format(newDateTime);
      },
      mode: CupertinoDatePickerMode.date,
    );
  }
}
