
class ChangePasswordInterface {

  final bool invisibleOldPassword;
  final bool invisibleNewPassword;
  final bool invisibleConfirmPassword;

  ChangePasswordInterface({
    this.invisibleOldPassword = true,
    this.invisibleNewPassword = true,
    this.invisibleConfirmPassword = true
  });

  ChangePasswordInterface copyWith({
    bool? invOldPass,
    bool? invNewPass,
    bool? invConfirmPass
  }){
    return ChangePasswordInterface(
      invisibleOldPassword: invOldPass ?? invisibleOldPassword,
      invisibleNewPassword: invNewPass ?? invisibleNewPassword,
      invisibleConfirmPassword: invConfirmPass ?? invisibleConfirmPassword
    );
  }

}