import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'capsule_state.dart';

class CapsuleCubit extends Cubit<CapsuleState> {
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  CapsuleCubit() : super(CapsuleState(activeIndex: 0));

  // تفعيل الكبسولة التالية
  void activateNext(int currentIndex) {
    if (currentIndex < controllers.length - 1) {
      focusNodes[currentIndex + 1].requestFocus();
    }
    emit(CapsuleState(activeIndex: currentIndex + 1));
  }

  // التحقق إذا كانت كل الحقول ممتلئة
  void checkFieldsFilled() {
    final allFilled =
        controllers.every((controller) => controller.text.isNotEmpty);
    emit(state.copyWith(allFieldsFilled: allFilled));
  }
}
