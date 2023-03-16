//email validator

String? emailValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please Enter Email';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please Enter Password';
  } else if(value.length<4){
    return 'Password must be 4 character';
  }
  return null;
}