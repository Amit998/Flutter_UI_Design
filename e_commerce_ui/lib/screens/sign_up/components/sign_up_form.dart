import 'package:e_commerce_ui/components/custom_surfix_icon.dart';
import 'package:e_commerce_ui/components/default_button.dart';
import 'package:e_commerce_ui/components/form_error.dart';
import 'package:e_commerce_ui/screens/complete_profile_page/complete_profile_screen.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  final List<String> errors = [];
  String confirm_password;
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionScreenHeight(28),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionScreenHeight(28),
          ),
          buildConfirmPasswordFormField(),
          FormError(errors: errors),
          SizedBox(
            height: getProportionScreenHeight(28),
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (errors.contains(kPassNullError) && errors.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (errors.contains(kShortPassError) && value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;

        
      },
      obscureText: true,
      validator: (value) {
        print(value.length);
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length <= 8) {
          addError(error: kShortPassError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter Your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
        // contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        print(password);
        print(confirm_password);
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (password == confirm_password && value.isNotEmpty) {
          removeError(error: kMatchPassError);
        }

        confirm_password = value;
      },
      obscureText: true,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (password != value) {
          addError(error: kMatchPassError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Confirm Your Passwrd",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
        // contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (errors.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter Your Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
        // contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
      ),
    );
  }
}
