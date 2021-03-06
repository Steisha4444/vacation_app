import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vacation_app/controllers/login_controller.dart';
import 'package:vacation_app/screens/home_screen.dart';
import 'package:vacation_app/screens/test_screen.dart';
import 'package:vacation_app/widgets/banner.dart' as banner;
import 'package:vacation_app/widgets/request_form.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginController());
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (controller.googleAccount.value?.email == null) {
        print('laaaaaa');
        print(controller.googleAccount.value?.email);
        return googleSignInButton();
      } else {
        return HomeScreen();
      }
    }));
  }

  SizedBox googleSignInButton() {
    return SizedBox(
      height: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/logo.png'),
            height: 100,
            width: 500,
          ),
          TextButton(
            onPressed: () {
              controller.login();
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Color.fromARGB(255, 72, 22, 148))),
              child: SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/google.png',
                      height: 25,
                      width: 25,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Continue with Google',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Center userInfo() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage:
                Image.network(controller.googleAccount.value?.photoUrl ?? '')
                    .image,
            radius: 100,
          ),
          Text(
            controller.googleAccount.value?.displayName ?? '',
            style: Get.textTheme.headline3,
          ),
          Text(
            controller.googleAccount.value?.email ?? '',
            style: Get.textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
