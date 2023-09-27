// ignore_for_file: deprecated_member_use

import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SummaryService {
  static Future<Dio> dioAuth() async {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://api.openai.com/v1/',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Const.apiKeyGPT}',
      },
      responseType: ResponseType.json,
    );
    return Dio(options);
  }

  static Future<String?> dioSummaryWithChatGPT(String message) async {
    try {
      Dio dio = await SummaryService.dioAuth();
      Response response = await dio.post(
        "/chat/completions",
        data: {
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "user", "content": "$message,Can you summarize this text for me?"}
          ],
        },
      );
      if (response.statusCode == 200) {
        String content = response.data['choices'][0]['message']['content'];
        return content;
      }
    } on DioError catch (e) {
      debugPrint(e.response!.data.toString());
      debugPrint("dioSummaryWithChatGPT  DioError: $e");
    } catch (e) {
      debugPrint("dioSummaryWithChatGPT  Error: $e");
    }
    return null;
  }
}
