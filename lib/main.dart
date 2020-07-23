import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectx/base/application.dart';
import 'package:projectx/base/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projectx/viewmodels/construction/construction_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:bot_toast/bot_toast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Application.initApp();
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<ConstructionBloc>(
            create: (_) => ConstructionBloc(),
          ),
        ],
        child: MyApp(),

      ),
  );
}

class MyApp extends StatelessWidget {
  final Router _router = Router();

  MyApp() {
    Routes.configureRoutes(_router);
    Application.router = _router;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
//    MultiBlocProvider(
//        providers: [
//        BlocProvider<CatalogBloc>(
//        create: (_) => CatalogBloc()..add(CatalogStarted()),
//    ),
//    BlocProvider<CartBloc>(
//    create: (_) => CartBloc()..add(CartStarted()),
//    ),
//    ],


      MaterialApp(
      initialRoute: Application.initRoute,
      onGenerateRoute: Application.router.generator,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[200],
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
        ),
      ),
      localizationsDelegates: [
        // this line is important
        RefreshLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      locale: const Locale('zh'),
      supportedLocales: [
        const Locale('en'),
        const Locale('zh'),
      ],
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        //print("change language");
        return locale;
      },
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
    );

//      );
  }
}
