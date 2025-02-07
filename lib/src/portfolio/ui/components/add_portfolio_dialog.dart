import 'package:flutter/material.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/core/themes/colors.dart';
import 'package:moneymatter/core/themes/text_style.dart';

enum PortfolioType {
  individual,
  institutional,
}

class AddPortfolioDialog extends StatefulWidget {
  const AddPortfolioDialog({super.key});

  @override
  State<AddPortfolioDialog> createState() => _AddPortfolioDialogState();
}

class _AddPortfolioDialogState extends State<AddPortfolioDialog> {
  late TextEditingController _portfolioNameController;
  PortfolioType _portfolioType = PortfolioType.individual;

  @override
  void initState() {
    super.initState();
    _portfolioNameController = TextEditingController();
  }

  @override
  void dispose() {
    _portfolioNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: AppColors().white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Add Portfolio",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            "Name",
            style: AppTextStyle().kTitleText.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: _portfolioNameController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "Portfolio Name",
              // iconColor: Colors.black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          RadioListTile(
            value: PortfolioType.individual,
            groupValue: _portfolioType,
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _portfolioType = value;
              });
            },
            activeColor: AppColors().black,
            title: Text(
              "Individual",
              style: AppTextStyle().kTitleText.copyWith(
                    color: Colors.black,
                  ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            dense: true,
          ),
          RadioListTile(
            value: PortfolioType.institutional,
            groupValue: _portfolioType,
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _portfolioType = value;
              });
            },
            activeColor: AppColors().black,
            title: Text(
              "Institutional",
              style: AppTextStyle().kTitleText.copyWith(
                    color: Colors.black,
                  ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            dense: true,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors().black,
              ),
              child: const Text("ADD"),
            ),
          )
        ],
      ).paddingAll(20),
    );
  }
}
