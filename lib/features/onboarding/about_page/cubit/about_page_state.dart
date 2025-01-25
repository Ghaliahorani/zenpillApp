class AboutPageState {
  final int selectedOption;
  final List<int> selectedLocations;
  final bool isButtonEnabled;
  final List<String> options;
  final List<String> locations;

  AboutPageState({
    this.selectedOption = -1,
    this.selectedLocations = const [],
    this.isButtonEnabled = false,
    this.options = const [],
    this.locations = const [],
  });
}

class AboutInitial extends AboutPageState {
  AboutInitial()
      : super(
          options: [
            'Freelancer',
            'Athlete',
            'Worker',
            'College Student',
            'Parent',
            'Other'
          ],
          locations: [
            'Beach',
            'Mountains',
            'Space',
            'Forest',
            'Cityscape',
            'Desert'
          ],
        );
}

class AboutOptionSelected extends AboutPageState {
  AboutOptionSelected({
    int selectedOption = -1,
    List<int> selectedLocations = const [],
    List<String> options = const [],
    List<String> locations = const [],
  }) : super(
          selectedOption: selectedOption,
          selectedLocations: selectedLocations,
          options: options,
          locations: locations,
          isButtonEnabled:
              selectedOption != -1 && selectedLocations.length == 3,
        );
}

class AboutLoading extends AboutPageState {
  AboutLoading({
    int selectedOption = -1,
    List<int> selectedLocations = const [],
    List<String> options = const [],
    List<String> locations = const [],
  }) : super(
          selectedOption: selectedOption,
          selectedLocations: selectedLocations,
          options: options,
          locations: locations,
        );
}

class AboutSuccess extends AboutPageState {
  AboutSuccess({
    int selectedOption = -1,
    List<int> selectedLocations = const [],
    List<String> options = const [],
    List<String> locations = const [],
  }) : super(
          selectedOption: selectedOption,
          selectedLocations: selectedLocations,
          options: options,
          locations: locations,
        );
}
