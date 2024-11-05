import 'package:flutter/material.dart';
import 'package:depok_keebs/menu.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
         colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(
            0xFF222831,
            <int, Color>{
              50: Color(0xFFE0E0E0),
              100: Color(0xFFB3B3B3),
              200: Color(0xFF808080),
              300: Color(0xFF4D4D4D),
              400: Color(0xFF262626),
              500: Color(0xFF222831), // primary color
              600: Color(0xFF1E232D),
              700: Color(0xFF191D23),
              800: Color(0xFF14171A),
              900: Color(0xFF0A0C0E),
            },
          ),
        ).copyWith(
          secondary: Color(0xFF00ADB5),
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
