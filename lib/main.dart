import 'dart:async';
import 'package:faculty_project/firebase_options.dart';
import 'package:faculty_project/presentation/router/app_router.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';
import 'business_logic/app_localization.dart';
import 'business_logic/bloc_observer.dart';
import 'business_logic/global_cubit/global_cubit.dart';
import 'data/local/cache_helper.dart';
import 'data/remote/dio_helper.dart';

late LocalizationDelegate delegate;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Dio
  DioHelper.init();

  // Initialize CacheHelper
  await CacheHelper.init();

  // Initialize translation delegate
  const locale = "en";
  delegate = await LocalizationDelegate.create(
    fallbackLocale: locale,
    supportedLocales: ['ar', 'en'],
  );
  await delegate.changeLocale(Locale(locale));

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(MyApp(
    appRouter: AppRouter(),
  ));

  // Set Bloc observer
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = delegate.currentLocale.languageCode;

    delegate.onLocaleChanged = (Locale value) async {
      try {
        setState(() {
          Intl.defaultLocale = value.languageCode;
        });
      } catch (e) {
        showToast(e.toString());
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit(),
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return LocalizedApp(
            delegate,
            LayoutBuilder(builder: (context, constraints) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Elmanassa',
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                  delegate,
                ],
                locale: delegate.currentLocale,
                supportedLocales: delegate.supportedLocales,
                onGenerateRoute: widget.appRouter.onGenerateRoute,
                theme: ThemeData(
                  fontFamily: 'cairo',
                  progressIndicatorTheme: const ProgressIndicatorThemeData(
                    color: AppColor.babyBlue,
                  ),
                  primarySwatch: AppColor.defaultColor,
                  textSelectionTheme: const TextSelectionThemeData(
                    selectionHandleColor: AppColor.babyBlue,
                    cursorColor: AppColor.babyBlue,
                    selectionColor: AppColor.babyBlue,
                  ),
                  radioTheme: RadioThemeData(
                    fillColor: MaterialStateColor.resolveWith(
                          (states) => AppColor.indigoDye,
                    ),
                  ),
                  splashColor: AppColor.indigoDye,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                    elevation: 0.0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: AppColor.transparent,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
