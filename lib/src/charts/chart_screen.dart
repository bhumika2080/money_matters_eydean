import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IndexChart extends ConsumerStatefulWidget {
  const IndexChart({super.key});

  @override
  ConsumerState<IndexChart> createState() => _TestChartState();
}

class _TestChartState extends ConsumerState<IndexChart> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return _buildDefaultPanningChart();
  }

  SfCartesianChart _buildDefaultPanningChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: const DateTimeAxis(
        name: 'X-Axis',
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: const NumericAxis(
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0),
      ),
      series: getDefaultPanningSeries(),
      zoomPanBehavior: ZoomPanBehavior(
        enablePinching: true,
        enablePanning: true,
      ),
    );
  }

  List<AreaSeries<DataPoint, DateTime>> getDefaultPanningSeries() {
    // var data = ref.watch(dataIndexList);
    return <AreaSeries<DataPoint, DateTime>>[
      AreaSeries<DataPoint, DateTime>(
        dataSource: data
            .map((point) => DataPoint(
                DateTime.fromMillisecondsSinceEpoch((point[0] as int) * 1000),
                point[1].toDouble()))
            .toList(),
        xValueMapper: (DataPoint point, _) => point.dateTime,
        yValueMapper: (DataPoint point, _) => point.value,
        gradient: LinearGradient(
          colors: <Color>[
            Colors.teal[50]!,
            Colors.teal[200]!,
            Colors.teal,
          ],
          stops: const <double>[0.0, 0.4, 1.0],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    ];
  }
}

class DataPoint {
  DataPoint(this.dateTime, this.value);
  final DateTime dateTime;
  final double value;
}

final data = [
  [1716354300, 2116.74],
  [1716354900, 2117.92],
  [1716354960, 2119.83],
  [1716355020, 2117.19],
  [1716355080, 2115.53],
  [1716355140, 2114.1],
  [1716355200, 2109.58],
  [1716355260, 2109.26],
  [1716355320, 2111.29],
  [1716355380, 2111.16],
  [1716355440, 2112.43],
  [1716355500, 2112.73],
  [1716355560, 2113.41],
  [1716355620, 2114.58],
  [1716355680, 2115.11],
  [1716355740, 2115.51],
  [1716355800, 2116.09],
  [1716355860, 2115.8],
  [1716355920, 2117.25],
  [1716355980, 2117.31],
  [1716356040, 2117.91],
  [1716356100, 2119.34],
  [1716356160, 2120.03],
  [1716356220, 2121.29],
  [1716356280, 2122.35],
  [1716356340, 2123.29],
  [1716356400, 2123.72],
  [1716356460, 2124.92],
  [1716356520, 2126.1],
  [1716356580, 2126.7],
  [1716356640, 2126.77],
  [1716356700, 2128.03],
  [1716356760, 2127.71],
  [1716356820, 2126.78],
  [1716356880, 2126.72],
  [1716356940, 2126.13],
  [1716357000, 2125.38],
  [1716357060, 2123.16],
  [1716357120, 2120.92],
  [1716357180, 2119.3],
  [1716357240, 2118.53],
  [1716357300, 2117.6],
  [1716357360, 2117.52],
  [1716357420, 2116.37],
  [1716357480, 2116.05],
  [1716357540, 2115.89],
  [1716357600, 2115.96],
  [1716357660, 2115.88],
  [1716357720, 2116.66],
  [1716357780, 2116.64],
  [1716357840, 2116.57],
  [1716357900, 2116.64],
  [1716357960, 2115.76],
  [1716358020, 2115.68],
  [1716358080, 2115.58],
  [1716358140, 2115.35],
  [1716358200, 2115.61],
  [1716358260, 2115.62],
  [1716358320, 2116.09],
  [1716358380, 2117.17],
  [1716358440, 2117.39],
  [1716358500, 2117.25],
  [1716358560, 2117.79],
  [1716358620, 2118.15],
  [1716358680, 2118.35],
  [1716358740, 2118.21],
  [1716358800, 2118.21],
  [1716358860, 2117.97],
  [1716358920, 2117.92],
  [1716358980, 2118.28],
  [1716359040, 2119.35],
  [1716359100, 2119.65],
  [1716359160, 2119.48],
  [1716359220, 2119.84],
  [1716359280, 2121],
  [1716359340, 2120.74],
  [1716359400, 2120.19],
  [1716359460, 2120.24],
];



///
///
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// import 'repository/chart_repository.dart';

// class IndexChart extends ConsumerStatefulWidget {
//   const IndexChart({super.key});

//   @override
//   ConsumerState<IndexChart> createState() => _IndexChartState();
// }

// class _IndexChartState extends ConsumerState<IndexChart> {
//   @override
//   Widget build(BuildContext context) {
//     final dataAsyncValue = ref.watch(dataIndexChartProvider);

//     return dataAsyncValue.when(
//       data: (data) {
//         final dataPoints = data
//             .map((point) => DataPoint(
//                 DateTime.fromMillisecondsSinceEpoch((point[0] as int) * 1000),
//                 point[1].toDouble()))
//             .toList();

//         return _buildDefaultPanningChart(dataPoints);
//       },
//       loading: () => const Center(child: CircularProgressIndicator()),
//       error: (error, stackTrace) => Center(child: Text('Error: $error')),
//     );
//   }

//   SfCartesianChart _buildDefaultPanningChart(List<DataPoint> dataPoints) {
//     return SfCartesianChart(
//       plotAreaBorderWidth: 0,
//       primaryXAxis: const DateTimeAxis(
//         name: 'X-Axis',
//         majorGridLines: MajorGridLines(width: 0),
//       ),
//       primaryYAxis: const NumericAxis(
//         axisLine: AxisLine(width: 0),
//         majorTickLines: MajorTickLines(size: 0),
//       ),
//       series: <AreaSeries<DataPoint, DateTime>>[
//         AreaSeries<DataPoint, DateTime>(
//           dataSource: dataPoints,
//           xValueMapper: (DataPoint point, _) => point.dateTime,
//           yValueMapper: (DataPoint point, _) => point.value,
//         ),
//       ],
//       zoomPanBehavior: ZoomPanBehavior(
//         enablePinching: true,
//         enablePanning: true,
//       ),
//     );
//   }
// }

// class DataPoint {
//   DataPoint(this.dateTime, this.value);
//   final DateTime dateTime;
//   final double value;
// }


// final data = [
//   [1716354300, 2116.74],
//   [1716354900, 2117.92],
//   [1716354960, 2119.83],
//   [1716355020, 2117.19],
//   [1716355080, 2115.53],
//   [1716355140, 2114.1],
//   [1716355200, 2109.58],
//   [1716355260, 2109.26],
//   [1716355320, 2111.29],
//   [1716355380, 2111.16],
//   [1716355440, 2112.43],
//   [1716355500, 2112.73],
//   [1716355560, 2113.41],
//   [1716355620, 2114.58],
//   [1716355680, 2115.11],
//   [1716355740, 2115.51],
//   [1716355800, 2116.09],
//   [1716355860, 2115.8],
//   [1716355920, 2117.25],
//   [1716355980, 2117.31],
//   [1716356040, 2117.91],
//   [1716356100, 2119.34],
//   [1716356160, 2120.03],
//   [1716356220, 2121.29],
//   [1716356280, 2122.35],
//   [1716356340, 2123.29],
//   [1716356400, 2123.72],
//   [1716356460, 2124.92],
//   [1716356520, 2126.1],
//   [1716356580, 2126.7],
//   [1716356640, 2126.77],
//   [1716356700, 2128.03],
//   [1716356760, 2127.71],
//   [1716356820, 2126.78],
//   [1716356880, 2126.72],
//   [1716356940, 2126.13],
//   [1716357000, 2125.38],
//   [1716357060, 2123.16],
//   [1716357120, 2120.92],
//   [1716357180, 2119.3],
//   [1716357240, 2118.53],
//   [1716357300, 2117.6],
//   [1716357360, 2117.52],
//   [1716357420, 2116.37],
//   [1716357480, 2116.05],
//   [1716357540, 2115.89],
//   [1716357600, 2115.96],
//   [1716357660, 2115.88],
//   [1716357720, 2116.66],
//   [1716357780, 2116.64],
//   [1716357840, 2116.57],
//   [1716357900, 2116.64],
//   [1716357960, 2115.76],
//   [1716358020, 2115.68],
//   [1716358080, 2115.58],
//   [1716358140, 2115.35],
//   [1716358200, 2115.61],
//   [1716358260, 2115.62],
//   [1716358320, 2116.09],
//   [1716358380, 2117.17],
//   [1716358440, 2117.39],
//   [1716358500, 2117.25],
//   [1716358560, 2117.79],
//   [1716358620, 2118.15],
//   [1716358680, 2118.35],
//   [1716358740, 2118.21],
//   [1716358800, 2118.21],
//   [1716358860, 2117.97],
//   [1716358920, 2117.92],
//   [1716358980, 2118.28],
//   [1716359040, 2119.35],
//   [1716359100, 2119.65],
//   [1716359160, 2119.48],
//   [1716359220, 2119.84],
//   [1716359280, 2121],
//   [1716359340, 2120.74],
//   [1716359400, 2120.19],
//   [1716359460, 2120.24],
// ];
 
