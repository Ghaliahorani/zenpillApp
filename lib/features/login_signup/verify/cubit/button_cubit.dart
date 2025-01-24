// import 'package:bloc/bloc.dart';
// import 'package:zenpill_app/features/login_signup/verify/cubit/capsule_state.dart';
//
// class ButtonCubit extends Cubit<ButtonState> {
//   ButtonCubit() : super(ButtonDisabledState());
//
//   /// تحقق من المدخلات لتحديث حالة الزر
//   void checkInputs(List<String> inputs) {
//     // التحقق إذا كانت كل المدخلات غير فارغة
//     bool isValid = inputs.every((input) => input.isNotEmpty);
//
//     if (isValid) {
//       emit(ButtonEnabledState()); // إذا كانت المدخلات صحيحة، تفعيل الزر
//     } else {
//       emit(ButtonDisabledState()); // إذا كانت المدخلات غير صحيحة، تعطيل الزر
//     }
//   }
// }
