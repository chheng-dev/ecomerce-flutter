import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final _formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();


  void _submitForm(){
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful!')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Icon(Icons.arrow_back_ios),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: ConfigConstants.fontSize3,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(
                  height: ConfigConstants.sizebox3,
                ),
                TextFieldWidget(
                  hintText: "Email",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please enter your email";
                    } else if (!value.contains('@')){
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: ConfigConstants.sizebox0),
                TextFieldWidget(
                  hintText: "Password",
                  controller: _passwordController,
                  validator: (value){
                    print("hi");
                    print(value);
                    if(value == null || value.isEmpty){
                      return "Please enter your password";
                    } else if (value.length > 8){
                      return "Password must be at last 8";
                    }
                    return null;
                  },
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: ConfigConstants.sizebox1),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Forgot Password?')),
                          );
                        },
                        child: Text(
                          "Forgot password",
                          style: TextStyle(color: Colors.black),
                        )
                      ),
                      Icon(
                        Icons.arrow_right_alt_sharp,
                        color: AppColors.errorColor,
                        size: ConfigConstants.iconSize2,
                      ),
                    ],
                  )
                ),
                SizedBox(height: ConfigConstants.sizebox2),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      elevation: 0,
                      backgroundColor: AppColors.primaryColor
                    ),
                    onPressed: _submitForm, 
                    child: Text(
                      "LOGIN", 
                      style: TextStyle(color: Colors.white),
                    )
                  ),
                ),
              ],
            ),
          ),
          // Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: ConfigConstants.margin3
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Or login with socail account"),
                SizedBox(height: ConfigConstants.sizebox2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: SvgPicture.asset(
                        "assets/images/google.svg",
                        width: 32.0,
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      padding: EdgeInsetsDirectional.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Icon(
                        Icons.facebook, 
                        size: 32,
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}