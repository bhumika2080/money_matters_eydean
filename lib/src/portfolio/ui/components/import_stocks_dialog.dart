import 'package:flutter/material.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/core/themes/colors.dart';

class ImportStocksDialog extends StatelessWidget {
  const ImportStocksDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: AppColors().white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ..._buildSection(
            "Import from Meroshare",
            "Login in to Meroshare => Go to My Transaction History => Click on Date => Download as CSV",
          ),
          Divider(
            color: AppColors().black,
          ),
          ..._buildSection(
            "Import from Meroshare",
            "Login in to TMS => Trade Management => Historic Trade Book => Choose Business Date => Search => Items Per Page (ALL) => Export to excel",
          ),
          Divider(
            color: AppColors().black,
          ),
          ..._buildSection(
            "Import from other apps",
          ),
        ],
      ).paddingSymmetric(10, 10),
    );
  }
}

Widget _selectFileButton() {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors().black,
      ),
      child: const Text("SELECT FILE"),
    ),
  );
}

List<Widget> _buildSection(String title, [String? subTitle]) {
  return [
    10.xGap,
    Text(
      title,
      style: AppTextStyle().kTitleText.copyWith(
            color: AppColors().black,
          ),
    ),
    const SizedBox(
      height: 15,
    ),
    if (subTitle != null)
      Text(
        subTitle,
        style: AppTextStyle().kNormalText,
      ),
    if (subTitle != null)
      const SizedBox(
        height: 10,
      ),
    _selectFileButton(),
  ];
}
