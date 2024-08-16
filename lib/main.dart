import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partenaire/bloc/add-logement-bloc.dart';
import 'package:partenaire/bloc/admin-bloc.dart';
import 'package:partenaire/bloc/admin-logement-bloc.dart';
import 'package:partenaire/bloc/auth-bloc.dart';
import 'package:partenaire/bloc/client-admin-bloc.dart';
import 'package:partenaire/bloc/course-bloc.dart';
import 'package:partenaire/bloc/decaissement-bloc.dart';
import 'package:partenaire/bloc/faq-bloc.dart';
import 'package:partenaire/bloc/partenaire-admin-bloc.dart';
import 'package:partenaire/bloc/partenaire-bloc.dart';
import 'package:partenaire/bloc/partenaire-valid-bloc.dart';
import 'package:partenaire/bloc/reclamation-bloc.dart';
import 'package:partenaire/bloc/reservation-bloc.dart';
import 'package:partenaire/bloc/restaurant/add-offre-special-bloc.dart';
import 'package:partenaire/bloc/restaurant/add-plats-restaurant-bloc.dart';
import 'package:partenaire/bloc/restaurant/admin-restaurant-bloc.dart';
import 'package:partenaire/bloc/restaurant/parametres-restaurant-bloc.dart';
import 'package:partenaire/bloc/restaurant/qr-code-bloc.dart';
import 'package:partenaire/bloc/settings-bloc.dart';
import 'package:partenaire/bloc/update-logement-bloc.dart';
import 'package:partenaire/bloc/zone-bloc.dart';
import 'package:partenaire/screens/about-us-screen.dart';
import 'package:partenaire/screens/add-partenaire-screen.dart';
import 'package:partenaire/screens/dahsbord-admin.dart';
import 'package:partenaire/screens/dashbord-logement.dart';
import 'package:partenaire/screens/dashbord-restaurant.dart';
import 'package:partenaire/screens/faq-screen.dart';
import 'package:partenaire/screens/home-screen.dart';
import 'package:partenaire/screens/login-page.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setPathUrlStrategy();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PartenairesBloc()),
      ChangeNotifierProvider(create: (_) => AuthBloc()),
      ChangeNotifierProvider(create: (_) => AdminBloc()),
      ChangeNotifierProvider(create: (_) => PartenaireAdmonBloc()),
      ChangeNotifierProvider(create: (_) => AdminPartenaireBloc()),
      ChangeNotifierProvider(create: (_) => AddLogementBloc()),
      ChangeNotifierProvider(create: (_) => ReservationBloc()),
      ChangeNotifierProvider(create: (_) => SettingsBloc()),
      ChangeNotifierProvider(create: (_) => PartenaireValidBloc()),
      ChangeNotifierProvider(create: (_) => ClientAdminBloc()),
      ChangeNotifierProvider(create: (_) => UpdateLogementBloc()),
      ChangeNotifierProvider(create: (_) => AdminRestaurantBloc()),
      ChangeNotifierProvider(create: (_) => AddPlatRestaurantBloc()),
      ChangeNotifierProvider(create: (_) => ParametresRestaurantBloc()),
      ChangeNotifierProvider(create: (_) => FaqBloc()),
      ChangeNotifierProvider(create: (_) => AddOffreSpecialBloc()),
      ChangeNotifierProvider(create: (_) => QrcodeBloc()),
      ChangeNotifierProvider(create: (_) => ReclamationBloc()),
      ChangeNotifierProvider(create: (_) => CoursesAdminBloc()),
      ChangeNotifierProvider(create: (_) => ZoneBloc()),
      ChangeNotifierProvider(create: (_) => DecaissementBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('en'), Locale('fr')],
      title: 'Partenaire Swapped',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Josefin_Sans'),
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder<SharedPreferences>(
              future: SharedPreferences.getInstance(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.getString('token') != "" &&
                      snapshot.data!.containsKey("token")) {
                    if (snapshot.data!.getString('role') == "admin") {
                      return const DashbordAdminScreen();
                    } else if (snapshot.data!.getString('role') == "logement") {
                      return const DashbordLogementScreen();
                    } else if (snapshot.data!.getString('role') ==
                        "restaurant") {
                      return const DashbordRestaurant();
                    } else {
                      return const HomeScreen();
                    }
                  } else {
                    return const HomeScreen();
                  }
                } else {
                  return const HomeScreen();
                }
              },
            ),
        '/login': (context) => const LoginScreen(),
        '/partenaires': (context) => const AddPartenaireScreen(),
        '/faq': (context) => const FaqScreen(),
        '/about-us': (context) => const AboutUsScreen(),
      },
    );
  }
}
