import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:m9_c3/home_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:device_preview/device_preview.dart';
import 'package:sizer/sizer.dart';
void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context,orientation,deviceType) {
          return ResponsiveApp(
            builder: (BuildContext context){
              return  MaterialApp(
                useInheritedMediaQuery: true,
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                home: const HomeScreen(),
              );
            },
          );
        }
    );
  }
}
