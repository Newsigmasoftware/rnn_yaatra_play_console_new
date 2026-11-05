class EditProfileInterface {

  final String? selectedProfile; 
  final bool isLoading;

  EditProfileInterface({this.selectedProfile, this.isLoading = false});

  EditProfileInterface copyWith({
    String? profileImage,
    bool? isLoading
  }) {
    return EditProfileInterface(
      selectedProfile: profileImage ?? selectedProfile,
      isLoading: isLoading ?? this.isLoading
    );
  }

}