class Validators {
  String? usernameValidation(value){
    if(value.isEmpty){
      return "Please enter username";
    }else{
      return null;
    }
  }
  String? passwordValidation(value) {
    if (value!.isEmpty) {
      return "Please enter password";
    } else if (value.length < 6) {
      return "Please enter 6 digit password";
    } else {
      return null;
    }
  }
}
