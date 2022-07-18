import 'dart:math';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vacation_app/api/users_api.dart';
import 'package:vacation_app/controllers/home_controller.dart';
import 'package:vacation_app/models/user.dart';

class LoginController extends GetxController {
  final _googleSignin = GoogleSignIn();
  final googleAccount = Rx<GoogleSignInAccount?>(null);
  User? user;
  final controller = Get.put(HomeController());
  @override
  void onInit() async {
    await login();
    restore();

    super.onInit();
  }

  restore() async {
    googleAccount.value = await _googleSignin.signInSilently();
  }

  addUser() async {
    final email = googleAccount.value!.email;
    final name = googleAccount.value!.displayName!;

    await UsersApi.addUser(User(
        email: email,
        fullName: name,
        isManager: true,
        vacationDays: Random().nextInt(14)));
  }

  getUser(String email) async {
    user = await UsersApi.getUser(email);
    // print(user?.vacationDays);
  }

  login() async {
    googleAccount.value = await _googleSignin.signIn();
    print("login");
    print(googleAccount.value);
    addUser();
    await getUser(await googleAccount.value!.email);
    print(user?.vacationDays);
    controller.onNavigate(0);
    update();
  }

  logout() async {
    googleAccount.value = await _googleSignin.signOut();
    print("logout");
    print(googleAccount.value);
  }
}
