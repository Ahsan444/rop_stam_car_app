import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_button.dart';
import '../../utils/app_loader.dart';
import '../../utils/app_text.dart';
import '../../utils/constants.dart';
import '../../utils/input_field.dart';
import '../../utils/validator.dart';
import '../controller/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerController = Get.find<RegisterController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const  Spacer(),
                      SizedBox(
                        height: 100,
                        child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/3456/3456426.png'),
                      ),
                      Form(
                        key: registerController.formKey,
                        child: Column(
                          children: [
                            InputField(
                              controller: registerController.emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: emailValidator,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.w),
                              child: InputField(
                                controller: registerController.passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                validator: passwordValidator,
                                hintText: 'Password',
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                            AppButton(
                              width: double.infinity,
                              height: 50,
                              onPressed: (){
                                appLoader(context, Constants.PRIMARY_COLOR);
                                if (registerController.formKey.currentState!
                                    .validate()) {
                                 registerController.registerUserMethod(registerController.emailController.text.trim(), registerController.passwordController.text.trim());
                                }
                              }, btnText: 'Register',
                            ),
                          ],
                        ),
                      ),
                      const  Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            text: 'Already have an account?',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: AppText(
                              text: 'Login',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Constants.PRIMARY_COLOR,
                            ),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
