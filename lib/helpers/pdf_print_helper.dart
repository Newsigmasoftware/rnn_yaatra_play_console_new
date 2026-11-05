// import 'package:flutter/services.dart';
// import 'package:printing/printing.dart';

// class PdfPrintHelper {

//   Future<void> printPdfFromUrl(String url) async {
//     await Printing.layoutPdf(
//       onLayout: (_) => NetworkAssetBundle(
//         Uri.parse(url),
//       ).load(url).then((value) => value.buffer.asUint8List()),
//     );

//     // final response = await http.get(Uri.parse(url));

//     // if (response.statusCode == 200) {
//     //   final bytes = response.bodyBytes;

//     //   await Printing.layoutPdf(
//     //     onLayout: (format) async => bytes,
//     //   );
//     // } else {
//     //   throw Exception("Failed to load PDF");
//     // }
//   }

// }