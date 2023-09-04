import '../../parent/data/models/student_model.dart';
import 'model/UserSecureStorage.dart';
import 'model/stor.dart';

class UserStorageHelper {
  static Future<void> executeDataRetrieval() async {
    print("............................................");
    String? password = await UserSecureStorage.getPassword();
    String? username = await UserSecureStorage.getUsername();
    String? email = await UserSecureStorage.getEmail();
    String? permissions = await UserSecureStorage.getPermissions();

    if (permissions.toString().contains("ولي امر")) {
      checkParentData();
    } else if (permissions.toString().contains("مدرس")) {
      checkTeacherData();
    }
    if (username != null &&
        password != null &&
        permissions != null &&
        email != null) {
      UserData.setUserDataValues(
        11,
        username,
        password,
        email,
        permissions,
      );
    }
  }

  static Future<void> checkParentData() async {
    ParentData parentData2 = await UserSecureStorage.getParentData();
    if (parentData2.isEmpty) {
    } else {
      UserData.setParentData(parentData2);
    }
  }

  static Future<void> checkTeacherData() async {
    TeacherData teacherData = await UserSecureStorage.getTeacherData();
    if (teacherData.isEmpty) {
    } else {
      UserData.setTeacherData(teacherData);
      checkParentData();
    }
  }

  static Future<void> storeUserData(String password, String username,
      String email, String permissions) async {
    await UserSecureStorage.setPassword(password);
    await UserSecureStorage.setUsername(username);
    await UserSecureStorage.setEmail(email);
    await UserSecureStorage.setPermissions(permissions);
  }

  static Future<void> deleteDataStorge() async {
    await UserSecureStorage.deleteToken();
    await UserSecureStorage.deletePassword();
    await UserSecureStorage.deleteUsername();
    await UserSecureStorage.deleteEmail();
    await UserSecureStorage.deletePermissions();
    await UserSecureStorage.deleteTeacherData();
   UserData.setUserDataValues(0, "", "", "","");
   UserData.setParentData(ParentData([]));
   UserData.setTeacherData(TeacherData("",[]));
    UserStorageHelper.executeDataRetrieval();
  }
}
