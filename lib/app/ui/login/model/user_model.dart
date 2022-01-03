//User model with name and password
class UserModel {
  String? userName;
  String? password;
  UserModel({this.password, this.userName});
}

class LoginCredentials {
  static List<UserModel>? usersList = [];
  //User model to validate the users
  UserModel user1 = UserModel(userName: '9898989898', password: 'password123');
  UserModel user2 = UserModel(userName: '9876543210', password: 'password123');
  LoginCredentials() {
    usersList!.add(user1);
    usersList!.add(user2);
  }
}
