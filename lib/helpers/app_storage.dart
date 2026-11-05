// import 'package:get_storage/get_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; 

class AppStorage{

  static final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));
  
  static Future<void> saveID(String value) async {
    await _secureStorage.write(key: "ID", value: value);
  }
  
  static Future<void> saveUserID(String value) async {
    await _secureStorage.write(key: "USERID", value: value);
  }
  static Future<void> saveUserName(String value) async {
    await _secureStorage.write(key: "USERNAME", value: value);
  }

  static Future<void> saveMobileNo(String value) async {
    await _secureStorage.write(key: "MOBILENO", value: value);
  }

  static Future<void> saveUserRoleID(String value) async {
    await _secureStorage.write(key: "USERROLEID", value: value);
  }
  
  static Future<void> saveToken(String value) async {
    await _secureStorage.write(key: "TOKEN", value: value);
  }
  
  static Future<void> saveUserLoginModel(String value) async {
    await _secureStorage.write(key: "USERMODEL", value: value);
  }

  static Future<String?> getID() async {
    return await _secureStorage.read(key: "ID");
  }
  
  static Future<String?> getUserID() async {
    return await _secureStorage.read(key: "USERID");
  }
  
  static Future<String?> getUserName() async {
    return await _secureStorage.read(key: "USERNAME");
  }
  
  static Future<String?> getUserRoleID() async {
    return await _secureStorage.read(key: "USERROLEID");
  }

  static Future<String?> getUserTOKEN() async {
    return await _secureStorage.read(key: "TOKEN");
  }
  
  static Future<String?> getMobileNo() async {
    return await _secureStorage.read(key: "MOBILENO");
  }

   

  static Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }

  // final box = GetStorage();

  // Map get getUserData => box.read('UserData') ?? {};
  // // String get getLanguageName => box.read('LanguageName') ?? Languages.English.name;
  // String get getUserID => box.read('UserID') ?? "";
  // String get getToken => box.read('Token') ?? "";
  // String get getUserRole => box.read('UserIDRole') ?? "";
  // bool get isGuestMode => box.read('guestMode') ?? false;
  

  // SaveUserID(String user_id) async {
  //   await box.write('UserID', user_id.toString());
  // }
  
  
  // SaveToken(String token) async {
  //   await box.write('Token', token.toString());
  // }

  // SaveGuestMode(bool guestMode) async {
  //   await box.write('guestMode', guestMode);
  // }

  // SaveUserRole(String role) async {
  //   await box.write('UserIDRole', role.toString());
  // }

  // removeUser() async {
  //   await box.remove('UserID');
  //   await box.remove('Token');
  //   await box.remove('UserIDRole');
  //   await box.remove('guestMode');
  // }

}   