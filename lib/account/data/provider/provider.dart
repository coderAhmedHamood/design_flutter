
 
class UserProvider{

Future<void> login(String email,String password) async {

    await Future.delayed(Duration(seconds: 3));

print("...............resive the data to profivder class .....");
print(email+""+password);
print(email+""+password);
print(email+""+password);
// RequestHandler requestHandler=RequestHandler();
print("...............resive the data ok .....");
// User.add("","");
}
Future<void> register(String email,String username,String password) async {
    await Future.delayed(Duration(seconds: 3));
print("...............register user .....");
print(email+""+username+""+password);
print(email+""+username+""+password);
print(email+""+username+""+password);
// RequestHandler requestHandler=RequestHandler();
print("...............register user ok .....");

// User.add("","");

}

}