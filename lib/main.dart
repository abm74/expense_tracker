import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((value) => runApp(const MainApp()));
  runApp(const MainApp());
}

var kColorScheme = ColorScheme.fromSeed(
  seedColor:const Color.fromARGB(255, 220, 7, 220)
);
// seedColor: Color.fromARGB(238, 2, 252, 40));
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 9, 167, 143),
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          color: kColorScheme.primary,
          // foregroundColor: kDarkColorScheme.onPrimary,
        ),
        bottomSheetTheme: const BottomSheetThemeData().copyWith(
          backgroundColor: kDarkColorScheme.background,
        ),

        // inputDecorationTheme: const InputDecorationTheme().copyWith(
        //   fillColor: Colors.white,
        //   color
        // ),
        cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            surfaceTintColor: kDarkColorScheme.onSecondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primary,
            foregroundColor: kDarkColorScheme.onPrimary,
          ),
        ),

        textTheme: ThemeData().textTheme.copyWith(
              titleSmall: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                // color: kColorScheme.tertiary,
                color: Colors.white,
              ),
              bodyMedium: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              bodySmall: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          color: kColorScheme.primary,
          foregroundColor: kColorScheme.onPrimary,
        ),
        bottomSheetTheme: const BottomSheetThemeData().copyWith(
            // backgroundColor: Colors.white,
            ),
        datePickerTheme: ThemeData().datePickerTheme.copyWith(
              backgroundColor: Colors.white,
            ),
        cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            // surfaceTintColor: kColorScheme.onPrimaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primary,
            foregroundColor: kColorScheme.onPrimary,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                color: kColorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                // color: kColorScheme.tertiary,
                color: Colors.black,
              ),
              bodyMedium: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              bodySmall: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
      ),
      home: const Expenses(),
    );
  }
}
