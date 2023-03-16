

String? validateName(String? value) {
  if (value==null || value.isEmpty) {
    return 'Please enter name';
  } else if(value.length < 3) {
    return 'Name must be at least 3 characters';
  }
  return null;
}

String? validateReg(String? value) {
  if (value==null || value.isEmpty) {
    return 'Please enter RegNum';
  } else if(value.length > 4) {
    return 'RegNum must be at most 4 characters';
  }
  return null;
}