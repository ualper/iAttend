import 'package:iattend/authenticate_face/authenticate_face_view.dart';
import 'package:iattend/common/views/custom_button.dart';
import 'package:iattend/common/utils/custom_snackbar.dart';
import 'package:iattend/common/utils/extensions/size_extension.dart';
import 'package:iattend/common/utils/screen_size_util.dart';
import 'package:iattend/constants/theme.dart';
import 'package:iattend/register_face/enter_password_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

/// The main function initializes the Flutter app and ensures that Firebase is initialized before
/// running the app.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

/// The `MyApp` class is the root widget of the application and sets the theme and initial route.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iAttend',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(accentColor: accentColor),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(20),
          filled: true,
          fillColor: primaryWhite,
          hintStyle: TextStyle(
            color: primaryBlack.withOpacity(0.6),
            fontWeight: FontWeight.w500,
          ),
          errorStyle: const TextStyle(
            letterSpacing: 0.8,
            color: Colors.redAccent,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const Home(),
    );
  }
}

/// The `Home` class represents the home screen of an app called "iAttend" and includes buttons for
/// registration and authentication.
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeUtilContexts(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              scaffoldTopGradientClr,
              scaffoldBottomGradientClr,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "iAttend",
              style: TextStyle(
                color: textColor,
                fontSize: 0.07.sh,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 0.07.sh),
            CustomButton(
              text: "Register",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EnterPasswordView(),
                  ),
                );
              },
            ),
            SizedBox(height: 0.025.sh),
            CustomButton(
              text: "Authenticate",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AuthenticateFaceView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void initializeUtilContexts(BuildContext context) {
    ScreenSizeUtil.context = context;
    CustomSnackBar.context = context;
  }
}
