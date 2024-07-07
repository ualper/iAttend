import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iattend/common/utils/custom_text_field.dart';
import 'package:iattend/common/views/custom_button.dart';
import 'package:iattend/common/utils/custom_snackbar.dart';
import 'package:iattend/constants/theme.dart';
import 'package:iattend/model/password_model.dart';
import 'package:iattend/register_face/register_face_view.dart';
import 'package:flutter/material.dart';

class EnterPasswordView extends StatelessWidget {
  EnterPasswordView({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();
  final _formFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appBarColor,
        title: const Text("Enter Password"),
        elevation: 0,
      ),
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
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  formFieldKey: _formFieldKey,
                  controller: _controller,
                  hintText: "Password",
                  validatorText: "Enter password to proceed",
                ),
                CustomButton(
                  text: "Continue",
                  onTap: () async {
                    if (_formFieldKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();

                      // Auto ID created by Firebase Firestore manually. 29IwvH2k6uoFq1ZZgCp3
                      DocumentReference docRef = FirebaseFirestore.instance.collection("password").doc("29IwvH2k6uoFq1ZZgCp3");

                      docRef.get().then((snap) {
                        if (snap.exists) {
                          Password password = Password.fromJson(snap.data() as Map<String, dynamic>);

                          if (password.password == _controller.text.trim()) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const RegisterFaceView(),
                              ),
                            );
                          } else {
                            CustomSnackBar.errorSnackBar("Wrong Password :( ");
                          }
                        } else {
                          CustomSnackBar.errorSnackBar("Document does not exist");
                        }
                      }).catchError((error) {
                        print("Firestore Error: $error");
                        // Hata durumunda geri deneme mekanizması ekleyebilirsiniz.
                        // Burada geri deneme mantığını ekleyebilirsiniz.
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
