import 'package:check_is_fresh_install/shared_preferences_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartUpWidget(),
    );
  }
}

class StartUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<bool>(
            future: SharedPreferencesManager().isFreshInstalled(),
            builder: (context, isFreshInstalledSnapshot) {
              if (isFreshInstalledSnapshot.hasData) {
                if (isFreshInstalledSnapshot.data) {
                  //You can return for example your onboarding widget/page
                  return OnboardingPage();
                } else {
                  //You can return your HomePage() or whatever widget/page
                  return HomePage();
                }
              } else {
                //For good user Experiance you can show Your App Logo/loading Screen
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("My Onboarding Page"),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("My Home Page"),
      ),
    );
  }
}
