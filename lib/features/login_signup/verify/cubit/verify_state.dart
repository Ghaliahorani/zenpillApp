class VerifyState {
  final int activeIndex;
  final bool allFieldsFilled;
  final bool isLoading;

  VerifyState({
    required this.activeIndex,
    this.allFieldsFilled = false,
    this.isLoading = false,
  });

  VerifyState copyWith({
    int? activeIndex,
    bool? allFieldsFilled,
    bool? isLoading,
  }) {
    return VerifyState(
      activeIndex: activeIndex ?? this.activeIndex,
      allFieldsFilled: allFieldsFilled ?? this.allFieldsFilled,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
