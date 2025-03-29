import 'dart:async';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';

var PhoneNumber;
var Country_phone_code;

class Sign_Up extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp();
}

class SignUp extends State<Sign_Up> {
  Country? _selectedCountry = Country(
    countryCode: 'IN',
    phoneCode: '91',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'India',
    example: '9123456789',
    displayName: 'India',
    displayNameNoCountryCode: 'India',
    e164Key: '91-IN-0',
  );
  String Country_code = "+91";
  TextEditingController _phoneController = TextEditingController();
  FocusNode _phoneFocusNode = FocusNode(); // Create a FocusNode

  Color _buttonColor = Colors.grey;

  @override
  void initState() {
    super.initState();

    // Request focus on the phone number TextField when the widget is initialized
    Future.delayed(Duration.zero, () {
      _phoneFocusNode.requestFocus();
    });

    _phoneController.addListener(() {
      setState(() {
        _buttonColor =
        _phoneController.text.length == 10 ? Color(0xFFE03537): Colors.grey;
      });
    });
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false, // This prevents keyboard overflow issues
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sign up text
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              // Sentences
              Row(
                children: [
                  Text(
                    "Get control of your business with ",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035, color: Colors.black38),
                  ),
                  Image.asset(
                    "Assets/Images/Vyapar_logo.png",
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: MediaQuery.of(context).size.width * 0.04,
                    color: Colors.grey,
                  ),
                  Text(
                    " Vyapar",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              GestureDetector(
                onTap: () {
                  // Open country picker on tap
                  showCountryPicker(
                    context: context,
                    showPhoneCode: true,
                    onSelect: (Country country) {
                      setState(() {
                        Country_code = "+${country.phoneCode}";
                        _selectedCountry = country;
                      });
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Row(
                    children: [
                      if (_selectedCountry != null)
                        Image.asset(
                          'icons/flags/png/${_selectedCountry!.countryCode.toLowerCase()}.png',
                          package: 'country_icons',
                          width: 24,
                          height: 24,
                        )
                      else
                        Icon(Icons.flag, color: Colors.grey),
                      SizedBox(width: 8),
                      Text(
                        _selectedCountry != null
                            ? "${_selectedCountry!.name}"
                            : "Select Country",
                        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextField(
                  style: TextStyle(fontSize:MediaQuery.of(context).size.width * 0.045),
                  focusNode: _phoneFocusNode,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Enter Mobile Number",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefix: Text(
                      Country_code,
                      style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.width * 0.045),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent, // Focused border color
                        width: 1.8,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              //Get otp button
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonColor,
                  ),
                  onPressed: () {
                    if(_phoneController.text.length == 10){
                      print("${_phoneController.text.length}");
                      PhoneNumber = _phoneController.text;
                      Country_phone_code = Country_code;
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Verifying_Otp()));
                    }
                  },
                  child: Text(
                    "Get Otp",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              // Or text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04, vertical: MediaQuery.of(context).size.height * 0.01),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1, // Thickness of the line
                        color: Colors.grey, // Color of the line
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
                      child: Text(
                        'or',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045, // Font size
                          color: Colors.grey, // Font color
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1, // Thickness of the line
                        color: Colors.grey, // Color of the line
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              //sign in with google
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                      SizedBox(
                          width: 20,
                          height: 20,
                          child: Image.asset("Assets/Images/google.png")),
                      SizedBox(width: 10),
                      Text(
                        "Sign in with google",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




class Verifying_Otp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => VerifyingOtp();
}

class VerifyingOtp extends State<Verifying_Otp>{

  TextEditingController _OtpeController = TextEditingController();
  FocusNode _OtpFocusNode = FocusNode();

  int _countdown = 30;
  Timer? _timer;
  bool _isResendButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      _OtpFocusNode.requestFocus();
   });

    _startCountdown();

  }
  void _startCountdown() {
    setState(() {
      _countdown = 30; // Reset countdown to 30 seconds
      _isResendButtonEnabled = false; // Disable resend button
    });

    _timer?.cancel(); // Cancel any previous timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _isResendButtonEnabled = true; // Enable resend button
          timer.cancel(); // Stop the timer
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _OtpFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
      ),
      body:Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child:Text("Verifying Otp",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "Otp sent to ",
                    style: TextStyle(fontSize: 13, color: Colors.black38),
                  ),
                  Text("${Country_phone_code}${PhoneNumber}",
                    style: TextStyle(fontSize: 13, color: Colors.black38),
                  ),
                  Text(
                    " Change ?",
                    style: TextStyle(fontSize: 13, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              SizedBox(
                height: 50,
                child: TextField(
                  focusNode: _OtpFocusNode,
                  controller: _OtpeController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Otp",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent, // Focused border color
                        width: 1.8,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child:Text("Resend Otp in ${_countdown}s",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 100,),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE03537),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "aapka vyapar")));
                  },
                  child: Text(
                    "Verify Otp",
                    style: TextStyle(color: Colors.white),
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















