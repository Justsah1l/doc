import 'package:appointease/firebase_options.dart';
import 'package:appointease/pages/chatbot.dart';
import 'package:appointease/pages/moneyreq.dart';
import 'package:appointease/pages/upipage.dart';
import 'package:appointease/pages/videocall.dart';
import 'package:appointease/services/authgate.dart';
import 'package:appointease/services/authservice.dart';
import 'package:appointease/services/openai.dart';
import 'package:appointease/themes/lighttheme.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: 'AIzaSyChZdJt9CdxRQ2JlEVbuvWqQ5B_zFjPBfY');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => Authservice(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lighttheme,
        home: videocall());
  }
}
