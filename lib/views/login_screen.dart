import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/controllers/login_controller.dart';
import 'package:ecomerce_app/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: false,
        // title: Icon(Icons.arrow_back_ios),
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
                  controller: _controller.emailController,
                  keyboardType: TextInputType.emailAddress
                ),
                SizedBox(height: ConfigConstants.sizebox0),
                TextFieldWidget(
                  hintText: "Password",
                  controller: _controller.passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: ConfigConstants.sizebox1),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pushReplacementNamed(context, "/forgot-password"),
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
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      elevation: 0,
                      backgroundColor: AppColors.primaryColor
                    ),
                    onPressed:() => _controller.login(context), 
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