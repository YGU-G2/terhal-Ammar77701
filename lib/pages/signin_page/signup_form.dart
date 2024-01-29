import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:terhal/controllers/theme_controller.dart';
import 'package:terhal/form/controls/data.dart';
import 'package:terhal/form/controls/password.dart';
import 'package:terhal/form/controls/select.dart';
import 'package:terhal/utils/constants.dart';
// import 'package:terhal/controllers/firebase_auth_controller.dart';
import 'package:terhal/widgets/button.dart';
// import 'package:terhal/widgets/loading.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.appLocalizations,
  });

  final GlobalKey<FormBuilderState> formKey;
  final AppLocalizations? appLocalizations;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // final FirebaseAuthController authController = Get.find();
  // final ThemeController themeController = Get.find();

  int currentStep = 0;
  double height = 400;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilder(
          key: widget.formKey,
          child: SizedBox(
            height: height,
            width: Get.width,
            child: Stepper(
              elevation: 0,
              currentStep: currentStep,
              type: StepperType.horizontal,              
              steps: [
                Step(
                  isActive: currentStep == 0,
                  title: Text("Step 1"),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Data(
                            name: "firstName",
                            label: "First Name",
                            prefixIcon: Icon(Icons.person),
                            width: Get.width / 2.35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Data(
                            name: "firstName",
                            label: "Last Name",
                            prefixIcon: Icon(Icons.person),
                            width: Get.width / 2.35,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Data(
                        name: "firstName",
                        label: "User Name",
                        prefixIcon: Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Data(
                        name: "Email",
                        label: "Email",
                        prefixIcon: Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _button(
                        "Next",
                        () {
                          setState(() {
                            currentStep++;
                            height = 400;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _buildSignInBtn(context)
                    ],
                  ),
                ),
                Step(
                  isActive: currentStep == 1,
                  title: Text("Step 2"),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Password(
                        name: "password",
                        label: "Password",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Password(
                        name: "password",
                        label: "Confirm Password",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Data(
                            name: "date",
                            label: "Date of Birth",
                            prefixIcon: Icon(Icons.calendar_today),
                            width: Get.width / 2.35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Select(
                            name: "gender",
                            label: "Gender",
                            options: ["Male", "Female"],
                            prefixIcon: Icon(Icons.person),
                            width: Get.width / 2.35,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _button(
                            "Next",
                            () {
                              setState(() {
                                currentStep++;
                                height = 470;
                              });
                            },
                          ),
                          _button(
                            "Back",
                            () {
                              setState(() {
                                currentStep--;
                                height = 400;
                              });
                            },
                          ),                     
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _buildSignInBtn(context)                      
                    ],
                  ),
                ),
                Step(
                  isActive: currentStep == 2,
                  title: Text("Step 3"),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Select(
                        options: ["Aden", "Haja"],
                        name: "password",
                        label: "Travel Companion",
                        prefixIcon: Icon(Icons.travel_explore),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Select(
                        options: ["Aden", "Haja"],
                        name: "password",
                        label: "Travel Companion",
                        prefixIcon: Icon(Icons.health_and_safety),
                      ),
                      SizedBox(
                        height: 20,
                      ),                      
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                          title: Text(
                              "Do you need a stroller or a stroller for people with special needs?"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _button(
                        "Create Account",
                        width: Get.width / 1.1,
                        () {
                          setState(() {
                            // currentStep++;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _button(
                        "Back",
                        () {
                          setState(() {
                            currentStep--;
                            height = 400;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _buildSignInBtn(context)                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _handleSignIn() async {
    if (widget.formKey.currentState!.saveAndValidate()) {
      // await authController.signInWithEmailAndPassword(
      //   widget.formKey.currentState!.value['email'],
      //   widget.formKey.currentState!.value['password'],
      // );
    }
  }

  Padding _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Data(
        name: 'email',
        label: widget.appLocalizations!.email,
        prefixIcon: const Icon(Icons.person),
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.email(),
        ],
      ),
    );
  }

  Padding _buildPassword() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Password(
        name: 'password',
        label: widget.appLocalizations!.password,
        prefixIcon: const Icon(Icons.lock),
        validators: [
          FormBuilderValidators.required(),
        ],
      ),
    );
  }

  Container _buildSinIn() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: Get.height * 0.06,
      width: Get.width,
      child: _buildSignInButton(),
    );
  }

  Button _button(String text, VoidCallback onPressed, {double width = 100}) {
    return Button(      
      width: width,
      text: text,
      onPressed: onPressed,
    );
  }

  Button _buildSignInButton() {
    return Button(
      text: widget.appLocalizations!.login,
      onPressed: _handleSignIn,
    );
  }

  Container _buildGoogleBtn() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: Get.height * 0.05,
      child: MaterialButton(
        onPressed: () async {
          // await authController
          //     .signInWithGoogle()
          //     .then((value) => Get.offAllNamed('home'));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Get.width * 0.05,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/googleimage.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(widget.appLocalizations!.continueWithGoogle),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildSignInBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.appLocalizations!.alreadyHaveAccount),
        SizedBox(width: Get.width * 0.01),
        GestureDetector(
          onTap: () => Get.toNamed('signup'),
          child: Text(
            widget.appLocalizations!.login,
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
