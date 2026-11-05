class KycInterface {

  final String? selectedPanImage;
  final String? passbookImage;
  final bool isLoading;

  KycInterface({
    this.selectedPanImage,
    this.passbookImage,
    this.isLoading = false,
  });

  KycInterface copyWith({
    String? panImage,
    String? passbkImage,
    bool? isLoading,
  }) {
    return KycInterface(
      passbookImage: passbkImage ?? passbookImage,
      selectedPanImage: panImage ?? selectedPanImage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
