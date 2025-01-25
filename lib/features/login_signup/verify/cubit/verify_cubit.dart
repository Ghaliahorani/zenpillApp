import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  VerifyCubit() : super(VerifyState(activeIndex: 0));

  // تفعيل الكبسولة التالية
  void activateNext(int currentIndex) {
    if (currentIndex < controllers.length - 1) {
      focusNodes[currentIndex + 1].requestFocus();
    }
    emit(VerifyState(activeIndex: currentIndex + 1));
  }

  // التحقق إذا كانت كل الحقول ممتلئة
  void checkFieldsFilled() {
    final allFilled =
        controllers.every((controller) => controller.text.isNotEmpty);
    emit(state.copyWith(allFieldsFilled: allFilled));
  }

  // تعيين حالة التحميل
  void setLoading() {
    emit(state.copyWith(isLoading: true));
  }

  // تعيين حالة تم التحميل
  void setLoaded() {
    emit(state.copyWith(isLoading: false));
  }
}
