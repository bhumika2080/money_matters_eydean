import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moneymatter/core/core.dart';

class BottomSheetSection extends StatelessWidget {
  const BottomSheetSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBottomSheet(context);
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: _buildBottomSheetInfo(
              Icons.business_center,
              "Portfolio",
              onTap: () => context.push(AppRoute().portfolioScreen),
            ),
          ),
          Flexible(
            child: _buildBottomSheetInfo(
              Icons.visibility_rounded,
              "Watchlist",
              onTap: () {
                context.push(AppRoute().watchlistScreen);
              },
            ),
          ),
          Flexible(
            child: _buildBottomSheetInfo(
              Icons.list,
              "Services",
              onTap: () {
                context.push(AppRoute().moreServiceScreen);
              },
            ),
          ),
          Flexible(
            child: _buildBottomSheetInfo(
              Icons.person,
              "Profile",
              onTap: () => context.push(AppRoute().profileScreen),
            ),
          ),
        ],
      ).paddingAll(12.0),
    );
  }

  Widget _buildBottomSheetInfo(
    IconData icon,
    String value, {
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          3.xGap,
          Text(value, style: AppTextStyle().kMenuTextStyle)
        ],
      ),
    );
  }
}
