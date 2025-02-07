// class ApiResponse<T> {
//   final int statusCode;
//   final String message;

//   final List<T> data;

//   ApiResponse({
//     required this.statusCode,
//     required this.message,
//     required this.data,
//   });

//   factory ApiResponse.fromJson(Map<String, dynamic> json,
//       T Function(Map<String, dynamic> dataList) fromJson) {
//     return ApiResponse<T>(
//       data: json["Values"] == null
//           ? []
//           : List<T>.from(json['Values'].map((x) => fromJson(x))),
//       statusCode: json["StatusCode"] ?? 0,
//       message: json["Message"] ?? "",
//     );
//   }
// }
