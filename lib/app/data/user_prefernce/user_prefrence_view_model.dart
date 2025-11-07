import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/auth/login_response.dart';
import '../../models/user/user_model.dart';
import '../../utils/enums/user_role.dart';

class UserPreference {
  static const String keyToken = "key_token";
  static const String keyIsLoggedIn = "is_logged_in";
  static const String keyUserRole = "user_role";
  static const String keySelectRole = "selected_role";
  static const String keyIsHome = "is_home";
  static const String keyIsJob = "is_job";
  static const String keyIsSetting = "is_setting";
  static const String keyIsProject = "is_project";
  static UserRole userRole = UserRole.seller;
  static String userToken = '';
  static String userData = 'userData';

  // Future<void> saveUser(LoginResponse response) async {
  //   // String token = response.token?.toString() ?? '';
  //   // print("🧪 Token runtime type: ${token.runtimeType}");
  //
  //   await saveString('key_token',response.token??'');
  //
  //   // bool isLoggedIn = response.successful == true;
  //   await saveBool('key_is_logged_in', response.successful??false);
  // }

  Future<bool> saveUser(LoginResponse responseModel) async {
    try {
      userToken = responseModel.token ?? '';
      bool isSuccess = responseModel.successful??false;
      // saveString(keyToken, userToken);
      // saveBool(keyIsLoggedIn, isSuccess);
      final savedToken = await saveString(keyToken, userToken);
      final savedLogin = await saveBool(keyIsLoggedIn,isSuccess);
      return savedToken && savedLogin;
    } catch (e) {
      print('Error saving user: $e');
      return false;
    }
  }

  Future<LoginResponse?> getUser() async {
    try {
      String? token = await getString(keyToken);
      bool? successful = await getBool(keyIsLoggedIn);

      // Return null if any essential field is missing
      if (token == null || successful == null) {
        return null;
      }
      userToken=token;
      userRole = await getSavedRole() ?? UserRole.seller;

      return LoginResponse(
        successful: successful,
        token: token,
        errors: null, // errors can be null
      );
    } catch (e) {
      print('Error retrieving user: $e');
      return null;
    }
  }
  // Save user role
  Future<void> saveUserToPrefs(UserModel user) async {
    String userJson = jsonEncode(user.toJson()); // convert object to json string
    await saveString(userData, userJson);
  }
  Future<void> saveRole(UserRole role) async {
    await saveInt(keySelectRole, role.index);
  }
  // Future<void> saveRole(int index) async {
  //   await saveInt(UserPreference.keySelectRole, index);
  // }
  //
  // Get saved role
  Future<UserRole?> getSavedRole() async {
    int? savedRoleIndex = await getInt(keySelectRole);
    return UserRole.values[savedRoleIndex ?? 0];
  }
  // Future<int?> getSavedRole() async {
  //   userRole = await getInt(UserPreference.keySelectRole) ?? 0;
  //   return userRole;
  // }
  // Remove user data
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
  // Future<bool> removeUser() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   sp.clear();
  //   return true;
  // }

  // Save a string value
  // Future<bool> saveString(String key, String value) async {
  //   try {
  //     SharedPreferences sp = await SharedPreferences.getInstance();
  //     return await sp.setString(key, value); // ✅ Do not decode value
  //   } catch (e) {
  //     print('❌ Error saving string: $e');
  //     return false;
  //   }
  // }
  // Future<bool> saveString(String key, String value) async {
  //   try {
  //     print('Saving key: $key with value: $value');
  //     SharedPreferences sp = await SharedPreferences.getInstance();
  //     bool result = await sp.setString(key, value);
  //     print('Save result: $result');
  //     return result;
  //   } catch (e) {
  //     print('Error saving string data: $e');
  //     return false;
  //   }
  // }


  Future<bool> saveString(String key, String value) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      return await sp.setString(key, value);
      // return true;
    } catch (e) {
      print('Error saving string data: $e');
      return false;
    }
  }

  // Retrieve a string value
  Future<String?> getString(String key) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      return sp.getString(key);
    } catch (e) {
      print('Error retrieving string data: $e');
      return "";
    }
  }

  // Save a string value
  Future<bool> saveInt(String key, int value) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setInt(key, value);
      return true;
    } catch (e) {
      print('Error saving string data: $e');
      return false;
    }
  }

  // Retrieve a string value
  Future<int?> getInt(String key) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      return sp.getInt(key);
    } catch (e) {
      print('Error retrieving string data: $e');
      return 0;
    }
  }

  Future<bool> saveBool(String key, bool value) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      return await sp.setBool(key, value); // ✅ No decoding
    } catch (e) {
      print('❌ Error saving bool data: $e');
      return false;
    }
  }

  // Retrieve a string value
  Future<bool?> getBool(String key) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      return sp.getBool(key);
    } catch (e) {
      print('Error retrieving bool data: $e');
      return false;
    }
  }

  // Clear all shared preferences data
  Future<bool> clearData() async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.clear();
      return true;
    } catch (e) {
      print('Error clearing data: $e');
      return false;
    }
  }
}
