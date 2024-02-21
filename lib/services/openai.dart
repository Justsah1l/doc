import 'dart:convert';

import 'package:appointease/services/openapi.dart';
import 'package:http/http.dart' as http;

class openai {
  final List<Map<String, String>> messages = [];
  Future<String> chatgpt(String prompt) async {
    messages.add({'role': 'user', 'content': prompt});
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apikey',
        },
        body: jsonEncode({
          'model': 'text-davinci-003',
          'messages': messages,
          'maxtokens': 250,
          'temperature': 0,
          'top_p': 1,
        }),
      );
      print(res.body);
      if (res.hashCode == 200) {
        print("worked");
        String cont = jsonDecode(res.body)['choices'][0]['message']['content'];
        cont = cont.trim();
        messages.add({'role': 'assistant', 'content': cont});
      } else {
        print(
            "-----------------------------didnt work------------------------------");
      }
      String cont = jsonDecode(res.body)['choices'][0]['message']['content'];
      cont = cont.trim();

      return cont;
    } catch (e) {
      return e.toString();
    }
  }
}
