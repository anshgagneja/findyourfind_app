import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../api/api.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../helper/pref.dart';
import '../../complete_profile/complete_profile_screen.dart';
import '../../orders/order_screen.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();
  String? address;
  String? state;
  String? city;
  String? zip;
  bool _isloading = true;
  final TextEditingController addressController = TextEditingController(text: "");
  final TextEditingController stateController = TextEditingController(text: "");
  final TextEditingController cityController = TextEditingController(text: "");
  final TextEditingController zipController = TextEditingController(text: "");


  final List<String?> errors = [];
  bool _isLoading = false;
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCartData();

  }

  Future getCartData() async {
    _isloading = true;

    var user_id = Pref.getInt(Pref.user_id);
    final response = await Api(context).getUserAddressList(user_id.toString());
    print("rest${response}");
    if (response == Api.defaultError) {
      _isloading = false;
    } else if (response == Api.internetError) {
      _isloading = false;
    } else if (response == Api.authError) {
      _isloading = false;
    } else {
      _isloading = false;
      final List addressData = [];
      addressData.clear();
      addressData.addAll(response);
      if(addressData.isNotEmpty){
        setState(() {
          address = addressData[0]["address"].toString();
          state = addressData[0]["state"].toString();
          city = addressData[0]["city"].toString();
          zip = addressData[0]["zip"].toString();
          addressController.text = address.toString();
          stateController.text = state.toString();
          cityController.text = city.toString();
          zipController.text = zip.toString();
        });

      }


    }


  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: addressController,
            onSaved: (newValue) => address = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kEmailNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Address",
              hintText: "Enter your addresss",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),

          const SizedBox(height: 20),
          TextFormField(
          controller: stateController,
            onSaved: (newValue) => state = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              }
              state = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPassNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "State",
              hintText: "Enter your state name",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,

            ),
          ),

          const SizedBox(height: 20),
          TextFormField(
            controller: cityController,
            onSaved: (newValue) => city = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              }
              city = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPassNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "City",
              hintText: "Enter your city name",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,

            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: zipController,
            onSaved: (newValue) => zip = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              }
              zip = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPassNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Zip Code",
              hintText: "Enter your zip code",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,

            ),
          ),
          const SizedBox(height: 20),
          FormError(errors: errors),
          const SizedBox(height: 20),
      ElevatedButton(
        onPressed: _isLoading ? null : _onSubmit,
        child: const Text("Place Order"),
        ),
      ],
      ),
    );
  }


  Future<void> _onSubmit() async {


    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState!.save();
      var user_id = Pref.getInt(Pref.user_id);
      final response = await Api(context).PlaceOrder(address.toString(),state.toString(),city.toString(),zip.toString(),user_id.toString());
      print("here string --> ${response}");
      print("here ${address.toString()+" "+state.toString()+" "+city.toString()+" "+zip.toString()+" "+user_id.toString()}");
      setState(() {
        _isLoading = false;
      });
      if(response == "true"){
          Api(context).apiSnackBar("Order Placed", 1);
          Navigator.pushNamed(context, OrderScreen.routeName);
      }
    }
  }
}
