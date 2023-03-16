import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_button.dart';
import '../../utils/constants.dart';
import '../../utils/input_field.dart';


class DialogWidget extends StatelessWidget {
  final formKey;
  final image, name, reg, hintText,hintReg;
  final String? Function(String?)? validateName;
  final String? Function(String?)? validateReg;
  final VoidCallback? onDeleted;
  final VoidCallback? onUpdate;

  const DialogWidget(
      {Key? key, this.formKey, this.image, this.name, this.reg, this.hintText, this.validateName, this.validateReg, this.onDeleted, this.onUpdate,this.hintReg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: SizedBox(
        height: 350.w,
        width: 300,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: image,
              ),
              InputField(
                controller: name,
                hintText:
                hintText,
                validator: validateName,
              ),
              Padding(
                padding: const EdgeInsets
                    .symmetric(
                    vertical: 15),
                child: InputField(
                  controller:
                  reg,
                  hintText: hintReg,
                  keyboardType:
                  TextInputType
                      .number,
                  validator: validateReg,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceAround,
                children: [
                  AppButton(
                    width: 120,
                    height: 45,
                    btnText: 'Delete',
                    color:
                    Constants.RED_COLOR,
                    onPressed: onDeleted,
                  ),
                  AppButton(
                    width: 120,
                    height: 45,
                    btnText: 'Update',
                    onPressed: onUpdate,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}