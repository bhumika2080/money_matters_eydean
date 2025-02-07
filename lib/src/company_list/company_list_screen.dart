import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moneymatter/core/core.dart';

import 'model/company_list_model.dart';
import 'repository/company_list_repository.dart';

class CompanyListScreen extends StatelessWidget {
  const CompanyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final response = ref.watch(fetchCompanyList);
        return Scaffold(
          appBar: AppBar(title: const Text('Company List')),
          body: RefreshIndicator(
            onRefresh: () async => await ref.refresh(fetchCompanyList.future),
            child: response.when(
              data: (data) => _buildDataList(data, ref),
              error: (error, stackTrace) => _buildErrorState(error, stackTrace),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDataList(List<CompanyModel> data, WidgetRef ref) {
    customLog('Data received: ${data.length} items');
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final company = data[index];
        return _buildDataInfo(context, company, index);
      },
    );
  }

  Widget _buildDataInfo(BuildContext context, CompanyModel company, int index) {
    final bgColor =
        index % 2 == 0 ? AppColors().kTableColor : AppColors().white;
    return Container(
      decoration: BoxDecoration(color: bgColor),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: InkWell(
        onTap: () {
          // context.pop(company);
          context.push(AppRoute().companyDetailScreen);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "(${company.symbol}) ${company.companyName}",
              style: AppTextStyle().kMenuTextStyle,
            ),
            5.xGap,
            Text(company.sectorName, style: AppTextStyle().kNormalText),
            8.xGap,
            _buildText(
              text: company.website,
              icon: Icons.link_rounded,
              textcolor: AppColors().kLinkColor,
              onTap: () {
                company.companyEmail.launchInBrowser();
              },
            ),
            _buildText(
              text: company.companyEmail,
              icon: Icons.mail_outline_rounded,
              textcolor: AppColors().orange,
              onTap: () {
                company.companyEmail.sendEmail();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText({
    required String text,
    IconData? icon,
    Color? textcolor,
    void Function()? onTap,
  }) {
    if (text.isNotEmpty) {
      return InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[Icon(icon, size: 18.0), 8.yGap],
            Text(
              text,
              style: AppTextStyle().kTableText.copyWith(color: textcolor),
            ),
          ],
        ).paddingSymmetric(5.0, 2.0),
      );
    }
    return 0.xGap;
  }

  Widget _buildErrorState(Object error, StackTrace stackTrace) {
    customLog(stackTrace.toString());
    return Center(child: Text('$error'));
  }
}
