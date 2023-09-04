import '../../../parent/data/models/student_model.dart';
import '../../../student/data/models/student_model.dart';
import '../UserStorageHelper.dart';
import '../model/UserSecureStorage.dart';
import '../model/stor.dart';

class UserProvider {
  Future<void> login(String email, String password) async {
    if (email.contains("ولي امر")) {
      ParentData parentData = ParentData([
        StudentModel(id: 1, name: 'عبداللة بن سيف'),
        StudentModel(id: 2, name: 'سيف بن سيف'),
        StudentModel(id: 3, name: 'علي بن سيف'),
      ]);
      UserSecureStorage.setParentData(parentData);
    } else if (email.contains("مدرس")) {
      ParentData parentData = ParentData([
        StudentModel(id: 1, name: 'عبداللة بن قاسم'),
        StudentModel(id: 2, name: 'سيف بن قاسم'),
        StudentModel(id: 3, name: 'علي بن قاسم'),
      ]);

      await UserSecureStorage.setParentData(parentData);

      TeacherData teacherData = TeacherData('رياضيات', [
        StudentClassModel(id: 1, name: 'الخامس'),
        StudentClassModel(id: 2, name: 'السادس'),
        StudentClassModel(id: 3, name: 'السابع'),
      ]);
      UserSecureStorage.setTeacherData(teacherData);
    }

    UserStorageHelper.storeUserData("12345", "ابو العرب", "ahmed@gmail", email);

    await UserStorageHelper.executeDataRetrieval();
    // await UserStorageHelper.checkParentData();
  }

  Future<void> register(String email, String username, String password) async {
    print("...............register user .....");
  }

  Future<void> logout() async {
    UserStorageHelper.deleteDataStorge();
  }
}
