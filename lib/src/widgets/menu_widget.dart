import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moneymatter/core/constants/screen_constants.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/more_service/model/menu_model.dart';

class GridMenuWidget extends StatelessWidget {
  // final void Function()? onTap;
  // final void Function()? onLongPress;
  final MenuModel modelInfo;
  final bool checkPremium;

  const GridMenuWidget({
    super.key,
    // this.onTap,
    // this.onLongPress,
    required this.modelInfo,
    this.checkPremium = false,
  });

  @override
  Widget build(BuildContext context) {
    print("@@@@@premium : $kHasPremium");
    return Container(
      width: 85.0,
      height: 85.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors().kTableColor,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        // onTap: (modelInfo.route != null
        //     ? () => modelInfo.arguments != null
        //         ? context.push(modelInfo.route!, extra: modelInfo.arguments)
        //         : context.push(modelInfo.route!)
        //     : null),
        // onTap: () {
        //   print("premium");
        //   print(kHasPremium);
        //   print("modelInfo.route : ${modelInfo.route}");
        //   !checkPremium
        //       ? (modelInfo.route != null
        //           ? () => modelInfo.arguments != null
        //               ? context.push(modelInfo.route!,
        //                   extra: modelInfo.arguments)
        //               : context.push(modelInfo.route!)
        //           : null)
        //       : (kHasPremium
        //           ? (modelInfo.route != null
        //               ? () => modelInfo.arguments != null
        //                   ? context.push(modelInfo.route!,
        //                       extra: modelInfo.arguments)
        //                   : context.push(modelInfo.route!)
        //               : null)
        //           : context.push(AppRoute().premiumPurchaseScreen));
        // },
        onTap: !checkPremium
            ? (modelInfo.route != null
                ? () => modelInfo.arguments != null
                    ? context.push(modelInfo.route!, extra: modelInfo.arguments)
                    : context.push(modelInfo.route!)
                : null)
            : (kHasPremium
                ? (modelInfo.route != null
                    ? () => modelInfo.arguments != null
                        ? context.push(modelInfo.route!,
                            extra: modelInfo.arguments)
                        : context.push(modelInfo.route!)
                    : null)
                : () => context.push(AppRoute().premiumPurchaseScreen)),

        // onTap: onTap ??
        //     (modelInfo.route != null
        //         ? () => context.push(modelInfo.route!)
        //         : null),
        // onLongPress: onLongPress,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // modelInfo.icon ?? const FlutterLogo() as Widget,
                  modelInfo.icon != null
                      ? Icon(
                              modelInfo.icon,
                              color: AppColors.kIconColor,
                            )
                      : const FlutterLogo(),
                  // const FlutterLogo(),
                  const SizedBox(height: 10.0),
                  Text(
                    modelInfo.name,
                    style: AppTextStyle().kMenuTextStyle,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ).paddingAll(5.0),
            ),
            if (modelInfo.slug != null)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: modelInfo.slug!.name == "NEW"
                        ? AppColors().red
                        : AppColors().orange,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 3.0),
                  child: Text(
                    modelInfo.slug!.name,
                    style: AppTextStyle().kNormalText.copyWith(
                          color: Colors.white,
                          fontSize: 8.0,
                        ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ListMenuWidget extends StatelessWidget {
  // final void Function()? onTap;
  final void Function()? onPinTap;
  final MenuModel modelInfo;

  const ListMenuWidget({
    super.key,
    // this.onTap,
    this.onPinTap,
    required this.modelInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors().kCardColor,
      ),
      child: InkWell(
        // onTap: onTap ??
        //     (modelInfo.route != null
        //         ? () => context.push(modelInfo.route!, extra: modelInfo.url)
        //         : null),
        onTap: (modelInfo.route != null
            ? () => modelInfo.arguments != null
                ? context.push(modelInfo.route!, extra: modelInfo.arguments)
                : context.push(modelInfo.route!)
            : null),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 70.0,
                        // child: FlutterLogo(),
                        child: modelInfo.icon != null
                            ? Icon(modelInfo.icon)
                            : const FlutterLogo(),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Text(
                          modelInfo.name,
                          style: AppTextStyle().kMenuTextStyle,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onPinTap,
                  icon: const Icon(Icons.favorite_outline_rounded),
                ),
              ],
            ).paddingAll(10.0),
            if (modelInfo.slug != null)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: modelInfo.slug!.name == "NEW"
                        ? AppColors().red
                        : AppColors().orange,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    modelInfo.slug!.name,
                    style: AppTextStyle().kNormalText.copyWith(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
