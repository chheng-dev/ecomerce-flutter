import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacementNamed(context, "/"),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: ConfigConstants.fontSize3,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: ConfigConstants.sizebox3),
            Text(
              "Please, enter your email address. You will receive a link to create a new password vai email",
            ),
            SizedBox(height: ConfigConstants.sizebox1),
            TextFieldWidget(
              controller: controller,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 64),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  elevation: 0,
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () => {},
                child: Text("SEND", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}