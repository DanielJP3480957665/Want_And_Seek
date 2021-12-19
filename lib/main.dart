import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:want_and_seek/model/google_sigin_in/google_sigin_in.dart';
import 'package:want_and_seek/view/want_diary.dart';

import 'model/google_sigin_in/google_sigin_in.dart';

final googleSignInProvider =
    ChangeNotifierProvider((ref) => GoogleSignInProvider());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (
      context,
      ref,
      child,
    ) {
      final provider = ref.watch(googleSignInProvider);

      return Scaffold(
        appBar: AppBar(
          title: const Text('daniel'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                // ref.read(googleSignInProvider).logout();
              },
            ),
          ],
        ),
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (provider.isSignIn) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                // User が null でなない、つまりサインイン済みのホーム画面へ
                return const WantDiary();
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInButton(
                        Buttons.Google,
                        text: 'Sign up with Google',
                        onPressed: () {
                          ref.read(googleSignInProvider).login;
                        },
                      ),
                    ],
                  ),
                );
              }
            }),
      );
    });
  }
}
