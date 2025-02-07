import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/top/top.dart';

class TopFiveSection extends ConsumerStatefulWidget {
  const TopFiveSection({super.key});

  @override
  SliderWidgetState createState() => SliderWidgetState();
}

class SliderWidgetState extends ConsumerState<TopFiveSection> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     ref.watch(fetchTopGainer);
  //     ref.watch(fetchTopLoser);
  //   });
  // }

  List<Widget> items() {
    var topFiveGainer = ref.watch(topFiveGainerData);
    var topFiveLoser = ref.watch(topFiveLoserData);
    return [
      buildList("Top Gainers", topFiveGainer, Colors.green, onTap: () {
        context.push(AppRoute().topGainerScreen);
      }),
      buildList("Top Losers", topFiveLoser, Colors.red, onTap: () {
        context.push(AppRoute().topLoserScreen);
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: items(),
        ),
        _buildIndicator(),
      ],
    );
  }

  Widget buildList(
    String title,
    List<TopModel> dataList,
    Color? color, {
    void Function()? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: AppColors().kBorderColor),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Chip(
              label: Text(
                title,
                style: AppTextStyle().kButtonText.copyWith(
                      color: AppColors().white,
                    ),
              ),
              backgroundColor: color,
            ),
            _buildTableHeader(),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  final items = dataList[index];
                  return _buildTableData(
                    symbol: items.symbol,
                    ch: "${items.pointChange}",
                    chPercent: "${items.percentageChange}",
                    ltp: "${items.ltp}",
                  );
                },
              ),
            ),
          ],
        ).paddingHorizontal(5.0),
      ),
    );
  }

  Widget _buildTableHeader() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            "Symbol",
            style: AppTextStyle().kSubTitleText,
          ),
        ),
        Expanded(
          child: Text(
            "CH",
            style: AppTextStyle().kSubTitleText,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            "CH%",
            style: AppTextStyle().kSubTitleText,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            "LTP",
            style: AppTextStyle().kSubTitleText,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  Widget _buildTableData({
    required String symbol,
    required String ch,
    required String chPercent,
    required String ltp,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            symbol,
            style: AppTextStyle().kNormalText,
          ),
        ),
        Expanded(
          child: Text(
            ch,
            style: AppTextStyle().kNormalText,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            chPercent,
            style: AppTextStyle().kNormalText,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            ltp,
            style: AppTextStyle().kNormalText,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    ).paddingAll(5.0);
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items().asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                  .withOpacity(_current == entry.key ? 0.9 : 0.4),
            ),
          ),
        );
      }).toList(),
    );
  }
}
