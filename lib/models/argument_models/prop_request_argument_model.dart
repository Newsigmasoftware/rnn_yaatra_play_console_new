class PropRequestArgumentModel {
  final bool? isRegisterNewMemeber;
  final bool? isRedirectBack;
  
  PropRequestArgumentModel({
    this.isRegisterNewMemeber = false,
    this.isRedirectBack = false
  });

  // Factory constructor to create an instance from a JSON map
  factory PropRequestArgumentModel.fromJson(Map<String, dynamic> json) {
    return PropRequestArgumentModel(
      isRegisterNewMemeber: json['isRegisterNewMemeber'] as bool? ?? false,
      isRedirectBack: json['isRedirectBack'] as bool? ?? false,
    );
  }

  // Method to convert an instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'isRegisterNewMemeber': isRegisterNewMemeber,
      'isRedirectBack': isRedirectBack,
    };
  }

  // Handy copyWith method for state management/navigation
  PropRequestArgumentModel copyWith({
    bool? isRegisterNewMemeber,
    bool? isRedirectBack,
  }) {
    return PropRequestArgumentModel(
      isRegisterNewMemeber: isRegisterNewMemeber ?? this.isRegisterNewMemeber,
      isRedirectBack: isRedirectBack ?? this.isRedirectBack,
    );
  }
}