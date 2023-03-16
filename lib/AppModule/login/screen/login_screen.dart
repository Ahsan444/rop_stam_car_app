import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rop_stam_assignment/AppModule/res/routes/route_name.dart';
import 'package:rop_stam_assignment/AppModule/utils/app_loader.dart';
import 'package:rop_stam_assignment/AppModule/utils/constants.dart';
import 'package:rop_stam_assignment/AppModule/utils/validator.dart';

import '../../utils/app_button.dart';
import '../../utils/app_text.dart';
import '../../utils/input_field.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loginController = Get.find<LoginController>();
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
                            'https://icon-library.com/images/person-png-icon/person-png-icon-29.jpg'),
                      ),
                      Form(
                        key: loginController.formKey,
                        child: Column(
                          children: [
                            InputField(
                              controller: loginController.emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: emailValidator,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.w),
                              child: InputField(
                                controller: loginController.passwordController,
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
                                if (loginController.formKey.currentState!
                                    .validate()) {
                                  appLoader(context, Constants.PRIMARY_COLOR);
                                  loginController.loginUserMethod(
                                      loginController.emailController.text
                                          .trim(),
                                      loginController.passwordController.text
                                          .trim());
                                }
                              }, btnText: 'Login',
                            ),
                          ],
                        ),
                      ),
                      const  Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            text: 'Don\'t have an account?',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          TextButton(
                              onPressed: () {
                             Get.toNamed(RouteName.registerScreen);
                              },
                              child: AppText(
                                text: 'Register',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Constants.PRIMARY_COLOR,
                              ),),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
