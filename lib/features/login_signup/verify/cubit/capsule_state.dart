class CapsuleState {
  final int activeIndex;
  final bool allFieldsFilled;

  CapsuleState({
    required this.activeIndex,
    this.allFieldsFilled = false,
  });

  CapsuleState copyWith({
    int? activeIndex,
    bool? allFieldsFilled,
  }) {
    return CapsuleState(
      activeIndex: activeIndex ?? this.activeIndex,
      allFieldsFilled: allFieldsFilled ?? this.allFieldsFilled,
    );
  }
}
