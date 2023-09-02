import '../../../parent/domain/entities/Student.dart';
import '../../../student/domain/entities/students_class_class.dart';
import '../model/UserSecureStorage.dart';
import '../model/stor.dart';

class UserProvider {
  Future<void> login(String email, String password) async {
    // await Future.delayed(Duration(seconds: 3));
    print(email);
    print(password);
    UserData.setUserDataValues(11, "ابو العرب", "12345", "email", "ولي امر");



UserSecureStorage userSecureStorage = UserSecureStorage();
// String email = 'example@example.com';
// String password = 'password123';

await UserSecureStorage.setToken('your_token_here');
await UserSecureStorage.setLists(['list1', 'list2', 'list3']);
await UserSecureStorage.setDates(DateTime.now());
await UserSecureStorage.setPassword("12345");
await UserSecureStorage.setUsername("ahmed@gmail");
await UserSecureStorage.setEmail("ahmed@gmail");
await UserSecureStorage.setPermissions(email);

// await UserSecureStorage.set("");


String? token = await UserSecureStorage.getToken();
List<String>? lists = await UserSecureStorage.getLists();
DateTime? dates = await UserSecureStorage.getDates();

 


// UserProvider().login(email, password);


    // if (email.contains("ولي امر")) {
    //   ParentData parentData = ParentData([
    //     StudentClass(id: 1, name: 'عبداللة سيف'),
    //     StudentClass(id: 2, name: 'سيف بن سيف'),
    //   ]);
    //   UserData.setParentData(parentData);
    // } else
     if (email.contains("مدرس")) {
      UserData.setUserDataValues(11, "ابو العرب", "12345", "email", "مدرس");
      TeacherData teacherData = TeacherData('رياضيات', [
        StudentsClassClass(id: 1, name: 'الخامس'),
        StudentsClassClass(id: 2, name: 'السادس'),
        StudentsClassClass(id: 3, name: 'السابع'),
      ]);
      UserData.setTeacherData(teacherData);
      await UserSecureStorage.setTeacherData(teacherData);
    }
  }

  Future<void> register(String email, String username, String password) async {
    // await Future.delayed(Duration(seconds: 3));
    print("...............register user .....");
    print(email + "" + username + "" + password);
    print(email + "" + username + "" + password);
    print(email + "" + username + "" + password);
// RequestHandler requestHandler=RequestHandler();
    print("...............register user ok .....");

// User.add("","");
  }

  Future<void> logout() async {
    UserData.setUserDataValues(0, "", "", "", "");
    print("ok logout ............");
    print("ok logout .............");
  }
}
