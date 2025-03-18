import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/widgets/profile_screen/list_status_profile_widget.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ConfigConstants.padding1,
          vertical: ConfigConstants.padding1
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ConfigConstants.fontSize3
              ),
            ),

            // User Profile
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: ConfigConstants.padding1,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    child: Image.network("https://dummyjson.com/icon/emilys/128"),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        "Oeung chungchheng",
                        style: TextStyle(
                          fontSize: ConfigConstants.fontSize1
                        ),
                      ),
                      subtitle: Text("chheng@vtenh.com"),
                    ),
                  )
                ],
              ),
            ),

            ListStatusProfileWidget(
              title: "My Order",
              description: "Already have 12 orders",
              onPress: (){},
            ),
            ListStatusProfileWidget(
              title: "Shipping addresses",
              description: "3 addresses",
              onPress: () {},
            ),
            ListStatusProfileWidget(
              title: "Payment methods",
              description: "Visa ***22",
              onPress: () {},
            ),
            ListStatusProfileWidget(
              title: "Promocodes",
              description: "You have specail promocodes",
              onPress: () {},
            ),
            ListStatusProfileWidget(
              title: "My Reviews",
              description: "4 reviews",
              onPress: () {},
            ),
            ListStatusProfileWidget(
              title: "Settings",
              description: "Notifications, password",
              onPress: () {},
            )
          ],
        ),
      ),
    );
  }
}
