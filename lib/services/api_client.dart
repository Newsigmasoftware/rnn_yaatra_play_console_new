import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/helpers/app_storage.dart';
import 'package:rnn_yaatra/routing/app_router.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';
import 'package:http/http.dart' as http; 

class ApiClient {

  Future<dynamic> api_post({
    required Map<String, dynamic> body,
    required String url,
    String? imagePath,
    String? fileKey,
    bool is_header_false = false,
    bool is_encode_body = false,
    bool is_multipart = false,
  }) async {
    try {
      final token = await AppStorage.getUserTOKEN();
      final userId = await AppStorage.getUserID();

      final Map<String, String> headers = {
        "Token": token ?? "",
        "UserId": userId ?? "",
      };

      final uri = Uri.parse("${APIURL.BASE_URL}$url");

      PrintLogs().print_console_white(
        message: "===> POST URL: $uri",
      );
      PrintLogs().print_console_white(
        message: "===> HEADERS: $headers",
      );
      PrintLogs().print_console_white(
        message: "===> REQUEST BODY: $body",
      );

      http.Response response;

      // ==========================================
      // MULTIPART FORM DATA
      // ==========================================
      if (is_multipart) {
        final request = http.MultipartRequest(
          'POST',
          uri,
        );

        if (!is_header_false) {
          request.headers.addAll(headers);
        }

        // Add normal fields
        body.forEach((key, value) {
          request.fields[key] = value?.toString() ?? "";
        });

        // Add image as actual file
        if (imagePath != null && imagePath.isNotEmpty) {
          final file = File(imagePath);

          if (await file.exists()) {
            request.files.add(
              await http.MultipartFile.fromPath(
                fileKey ?? "FileData",
                imagePath,
              ),
            );
          }
        }

        PrintLogs().print_console_white(
          message: "===> MULTIPART FIELDS: ${request.fields}",
        );
        PrintLogs().print_console_white(
          message: "===> FILES: ${request.files.map((e) => e.field).toList()}",
        );
        final streamedResponse = await request.send().timeout(
          const Duration(seconds: 20),
        );
        response = await http.Response.fromStream(
          streamedResponse,
        );
      }

      // ==========================================
      // JSON REQUEST
      // ==========================================
      else if (is_encode_body) {
        headers['Content-Type'] = 'application/json';
        response = await http.post(
          uri,
          body: jsonEncode(body),
          headers: is_header_false ? {} : headers,
        ).timeout(
          const Duration(seconds: 20),
        );
      }
      // ==========================================
      // NORMAL REQUEST
      // ==========================================
      else {
        response = await http.post(
          uri,
          body: body.map(
            (key, value) => MapEntry(
              key,
              value?.toString() ?? "",
            ),
          ),
          headers: is_header_false ? {} : headers,
        ).timeout(
          const Duration(seconds: 20),
        );
      }

      PrintLogs().print_console_white(
        message: "===> RESPONSE ${response.body}",
      );

      PrintLogs().print_console_white(
        message: "===> STATUS CODE ${response.statusCode}",
      );

      if (response.statusCode == 401 ||
          response.statusCode == 403) {
        await AppStorage.deleteAll();

        AppRouter.router.go(
          AppRouteString.Login,
          extra: {
            "sessionValidationMsg":
            "Session Out. Please Login Again.!"
          },
        );

        return null;
      }

      if (response.body.trim().isEmpty) {
        return null;
      }

      return jsonDecode(response.body);

    } on TimeoutException catch (error) {
      PrintLogs().print_console(
        message: "TIMEOUT ERROR",
        e: error.toString(),
      );
      return null;
    } catch (e) {
      PrintLogs().print_console(
        message: "API ERROR",
        e: e.toString(),
      );
      return null;
    }
  }

  api_get({url, is_header_false}) async {
    try {
      var token = await AppStorage.getUserTOKEN();
      var userId = await AppStorage.getUserID();

      Map<String, String> headers = {
        "Token": token ?? "",
        "UserId": userId ?? "",
      };

      final fullUrl = "${APIURL.BASE_URL}$url";
      PrintLogs().print_console_white(message: "===> GET URL: $fullUrl");
      PrintLogs().print_console_white(message: "===> HEADERS: ${headers.toString()}");

      var request = await http.get(
        Uri.parse(fullUrl),
        headers: is_header_false == true ? {} : headers,
      ).timeout(
        const Duration(seconds: 20),
      );

      PrintLogs().print_console_white(message: "===> RESPONSE: ${request.body.toString()}");
      PrintLogs().print_console_white(message: "===> STATUS CODE: ${request.statusCode}");
      
      if (request.statusCode == 401 || request.statusCode == 403) {
        await AppStorage.deleteAll();
        AppRouter.router.go(AppRouteString.Login);
        return null;
      }

      if (request.body.trim().isEmpty) {
        return null;
      }

      return json.decode(request.body);

    } on TimeoutException catch (error) {
      PrintLogs().print_console(message: "===> TIMEOUT ERROR ${error.toString()}");
      return null;
    } catch (e) {
      PrintLogs().print_console(message: "===> API ERROR ${e.toString()}");
      return null;
    }
  }

  api_put({required Map<String, dynamic> body, url, is_header_false}) async {
    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
      };

      final fullUrl = "${APIURL.BASE_URL}$url";
      PrintLogs().print_console_white(message: "===> PUT URL: $fullUrl");
      PrintLogs().print_console_white(message: "===> REQUEST BODY: ${body.toString()}");
      PrintLogs().print_console_white(message: "===> HEADERS: ${headers.toString()}");

      var request = await http.put(
        Uri.parse(fullUrl),
        body: body,
        headers: is_header_false == true ? {} : headers,
      ).timeout(
        const Duration(seconds: 20),
      );

      PrintLogs().print_console_white(message: "===> RESPONSE: ${request.body.toString()}");
      PrintLogs().print_console_white(message: "===> STATUS CODE: ${request.statusCode}");

      if (request.body.trim().isEmpty) {
        return null;
      }

      return json.decode(request.body);

    } on TimeoutException catch (error) {
      PrintLogs().print_console(message: "===> TIMEOUT ERROR ${error.toString()}");
      return null;
    } catch (e) {
      PrintLogs().print_console(message: "===> API ERROR ${e.toString()}");
      return null;
    }
  }

  api_delete({required Map<String, dynamic> body, url, is_header_false}) async {
    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
      };

      final fullUrl = "${APIURL.BASE_URL}$url";
      PrintLogs().print_console_white(message: "===> DELETE URL: $fullUrl");
      PrintLogs().print_console_white(message: "===> REQUEST BODY: ${body.toString()}");
      PrintLogs().print_console_white(message: "===> HEADERS: ${headers.toString()}");

      var request = await http.delete(
        Uri.parse(fullUrl),
        body: body,
        headers: is_header_false == true ? {} : headers,
      ).timeout(
        const Duration(seconds: 20),
      );

      PrintLogs().print_console_white(message: "===> RESPONSE: ${request.body.toString()}");
      PrintLogs().print_console_white(message: "===> STATUS CODE: ${request.statusCode}");

      if (request.body.trim().isEmpty) {
        return null;
      }

      return json.decode(request.body);

    } on TimeoutException catch (error) {
      PrintLogs().print_console(message: "===> TIMEOUT ERROR ${error.toString()}");
      return null;
    } catch (e) {
      PrintLogs().print_console(message: "===> API ERROR ${e.toString()}");
      return null;
    }
  }

}
