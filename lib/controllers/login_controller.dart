import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  @override
  void onInit() {
    restore();
    super.onInit();
  }

  restore() async {
    googleAccount.value = await _googleSignin.signInSilently();
  }

  login() async {
    googleAccount.value = await _googleSignin.signIn();
  }

  logout() async {
    googleAccount.value = await _googleSignin.signOut();
  }
}
