import 'package:e_commerce_ui/components/custom_surfix_icon.dart';
import 'package:e_commerce_ui/components/default_button.dart';
import 'package:e_commerce_ui/components/form_error.dart';
import 'package:e_commerce_ui/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String firstName;
  String lastName;
  String phoneNo;
  String address;
  final List<String> errors = [];

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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getProportionScreenHeight(20),
              ),
              buildFirstNameFormField(),
              SizedBox(
                height: getProportionScreenHeight(20),
              ),
              buildLastNameFormField(),
              SizedBox(
                height: getProportionScreenHeight(20),
              ),
              buildPhoneNoFormField(),
              SizedBox(
                height: getProportionScreenHeight(20),
              ),
              buildAddressFormField(),
              FormError(errors: errors),
              SizedBox(
                height: getProportionScreenHeight(20),
              ),
              DefaultButton(
                  text: "Continue",
                  press: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.pushNamed(context, OtpScreen.routeName);
                    }
                  }),
              SizedBox(
                height: getProportionScreenHeight(20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (errors.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter Your Address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/LocationPoint.svg",
        ),
        // contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
      ),
    );
  }

  TextFormField buildPhoneNoFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNo = newValue,
      onChanged: (value) {
        if (errors.isNotEmpty) {
          removeError(error: kPhoneNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Nmber",
        hintText: "Enter Your Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Phone.svg",
        ),
        // contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (errors.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter Your Last Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/User.svg",
        ),
        // contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (errors.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter Your First Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/User.svg",
        ),
        // contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
      ),
    );
  }
}
