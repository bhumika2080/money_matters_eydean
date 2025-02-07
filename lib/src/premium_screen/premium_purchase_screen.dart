import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:moneymatter/core/core.dart';

class PremiumPurchaseScreen extends StatelessWidget {
  const PremiumPurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Subscription")),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors().kCardColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      "Subscription Info",
                      style: TextStyle(
                        color: AppColors().black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColors().black,
                  ).paddingVertical(5),
                  _buildRow("Subscription Type", "FREE"),
                  5.xGap,
                  _buildRow("Subscription Date", "N/A"),
                  5.xGap,
                  _buildRow("Expiry Date", "N/A"),
                  5.xGap,
                  _buildRow("Expired", "N/A"),
                ],
              ),
            ),
            10.xGap,
            Text(
              "Packages",
              style: TextStyle(
                color: AppColors().black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            10.xGap,
            Text(
              "Note : If you subscribe for a new package before it expires, remaining days will be added to your new subscription.",
              style: AppTextStyle().kNormalText,
              textAlign: TextAlign.center,
            ).paddingSymmetric(20),
            10.xGap,
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors().kCardColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "AD FREE + PREMIUM",
                        style: TextStyle(
                          color: AppColors().black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        onTap: () => _showFeatures(context),
                        child: Row(
                          children: [
                            Text(
                              "View Features",
                              style: AppTextStyle().kTitleText.copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            const SizedBox(
                              width: 1,
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: AppColors().black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors().black,
                  ).paddingVertical(5),
                  _buildSubscriptionRow("6 Months", 420),
                  15.xGap,
                  _buildSubscriptionRow("1 Year", 660),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildRow(String title, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: AppTextStyle().kNormalText,
      ),
      Text(
        value,
        style: AppTextStyle().kTitleText.copyWith(
              color: AppColors().black,
            ),
      )
    ],
  );
}

Widget _buildSubscriptionRow(String duration, int priceButton) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        duration,
        style: TextStyle(
          color: AppColors().black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors().kTableHeaderColor,
          ),
          child: Text(
            "Subscribe (Rs $priceButton)",
            style: TextStyle(
              color: AppColors().white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ).paddingSymmetric(15, 10),
        ),
      )
    ],
  );
}

void _showFeatures(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: AppColors().white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "FEATURES",
            style: TextStyle(
              color: AppColors().black,
              fontSize: 18,
            ),
          ),
          20.xGap,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFeatures("Broker Analysis"),
              _buildFeatures("Broker Favorites"),
              _buildFeatures("Stockwise Analysis"),
              _buildFeatures("Broker Favorites"),
              _buildFeatures("Broker Favorites"),
              _buildFeatures("Broker Favorites"),
              _buildFeatures("Broker Favorites"),
              _buildFeatures("AI Signals", false),
            ],
          ).paddingHorizontal(10)
        ],
      ).paddingAll(20),
    ),
  );
}

Widget _buildFeatures(String feature, [bool hasFeature = true]) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        hasFeature ? Ionicons.checkmark_circle : Ionicons.close_circle,
        color: hasFeature ? AppColors().green : AppColors().red,
        size: 18,
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        feature,
        style: AppTextStyle().kTitleText.copyWith(
              color: AppColors().green,
            ),
      )
    ],
  ).paddingBottom(10);
}
