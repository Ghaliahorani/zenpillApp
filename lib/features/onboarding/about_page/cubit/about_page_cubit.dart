import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zenpill_app/features/onboarding/about_page/cubit/about_page_state.dart';

class AboutPageCubit extends Cubit<AboutPageState> {
  AboutPageCubit() : super(AboutInitial());

  final List<String> _options = [
    'Freelancer',
    'Athlete',
    'Worker',
    'College Student',
    'Parent',
    'Other'
  ];

  final List<String> _locations = [
    'Beach',
    'Mountains',
    'Space',
    'Forest',
    'Cityscape',
    'Desert'
  ];

  List<String> get options => _options;

  List<String> get locations => _locations;

  void selectOption(int index) {
    // فقط تعديل الحالة لاختيار خيار.
    emit(AboutOptionSelected(
      selectedOption: index,
      selectedLocations: state.selectedLocations,
      options: _options,
      locations: _locations,
    ));
  }

  void selectLocation(int index) {
    var selectedLocations = List<int>.from(state.selectedLocations);
    if (selectedLocations.contains(index)) {
      selectedLocations.remove(index);
    } else if (selectedLocations.length < 3) {
      selectedLocations.add(index);
    }

    emit(AboutOptionSelected(
      selectedOption: state.selectedOption,
      selectedLocations: selectedLocations,
      options: _options,
      locations: _locations,
    ));
  }

  Future submitForm() async {
    // فقط للتحميل دون تغيير البيانات.
    emit(AboutLoading(
      selectedOption: state.selectedOption,
      selectedLocations: state.selectedLocations,
      options: _options,
      locations: _locations,
    ));
    await Future.delayed(Duration(seconds: 2));
    emit(AboutSuccess(
      selectedOption: state.selectedOption,
      selectedLocations: state.selectedLocations,
      options: _options,
      locations: _locations,
    ));
  }
}
