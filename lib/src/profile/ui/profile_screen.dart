import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:moneymatter/core/constants/screen_constants.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/profile/ui/components/icon_text_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            _profileInfo(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buttonsList().paddingTop(10),
                // 10.yGap,
                Divider(
                  color: AppColors().black,
                ),
                _anotherButtonsList(),
                20.xGap,
                Text(
                  "Version : 10.0.2 (267)",
                  style: AppTextStyle().kTitleText,
                ).paddingLeft(20),
                20.xGap,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _profileInfo() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: kScreenHeight * 0.015),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors().primaryColor,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircleAvatar(
          radius: 45,
          backgroundColor: Colors.pink,
          // backgroundImage: AssetImage(),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Prajwal Thapa",
          style: AppTextStyle().kTitleText.copyWith(color: Colors.white),
        ),
        Text(
          "prajwal.18122@nict.edu.np",
          style: AppTextStyle().kNormalText.copyWith(
                color: AppColors().white,
              ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "FREE",
          style: AppTextStyle().kTitleText.copyWith(
                color: AppColors().white,
              ),
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors().blue,
            ),
            child: Text(
              "Log Out",
              style: AppTextStyle().kButtonText.copyWith(
                    color: AppColors().white,
                  ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buttonsList() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      IconTextButton(
        icon: Ionicons.reader,
        text: "Subscription",
        onPressed: () {},
      ),
      IconTextButton(
        icon: Ionicons.logo_whatsapp,
        text: "Contact Us (Whatsapp)",
        onPressed: () {},
      ),
      IconTextButton(
        icon: Ionicons.settings_outline,
        text: "Settings",
        onPressed: () {},
      ),
      IconTextButton(
        icon: Ionicons.reader_outline,
        text: "Terms and Conditions",
        onPressed: () {},
      ),
      IconTextButton(
        icon: Ionicons.lock_closed,
        text: "Privacy Policy",
        onPressed: () {},
      ),
      IconTextButton(
        icon: Ionicons.sync_outline,
        text: "Check for Updates",
        onPressed: () {},
      ),
    ],
  ).paddingHorizontal(10);
}

Widget _anotherButtonsList() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      IconTextButton(
        icon: Ionicons.logo_facebook,
        text: "Facebook Group",
        onPressed: () {},
      ),
      IconTextButton(
        icon: Ionicons.arrow_redo_circle,
        text: "Share Hub Community",
        onPressed: () {},
      ),
      IconTextButton(
        icon: Ionicons.logo_facebook,
        text: "Like Us",
        onPressed: () {},
      ),
      IconTextButton(
        icon: Ionicons.logo_tiktok,
        text: "Follow Us",
        onPressed: () {},
      ),
      IconTextButton(
        icon: Ionicons.logo_youtube,
        text: "Subscribe Us",
        onPressed: () {},
      ),
      IconTextButton(
        icon: Ionicons.logo_instagram,
        text: "Follow Us",
        onPressed: () {},
      ),
      IconTextButton(
        icon: Ionicons.logo_google_playstore,
        text: "Rate Us",
        onPressed: () {},
      ),
      IconTextButton(
        icon: Ionicons.information_circle,
        text: "About Us",
        onPressed: () {},
      ),
    ],
  ).paddingHorizontal(10);
}
