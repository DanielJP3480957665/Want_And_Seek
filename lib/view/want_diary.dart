import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:want_and_seek/root_page/root_page.dart';

class WantDiary extends StatelessWidget {
  const WantDiary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RootPage(),
      initialRoute: 'first',
      // routes: <String, WidgetBuilder>{
      //   'first': (_) => ProviderScope(
      //         child: RootPage(),
      //       ),
      // },
    );
  }
}

class WantDiaryPage extends ConsumerWidget {
  const WantDiaryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 3.0,
                          ),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.green[300],
                        ),
                        labelText: 'フレームあり、ラベルあり',
                        floatingLabelStyle: const TextStyle(fontSize: 12),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.green[100]!,
                            width: 4.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 3.0,
                          ),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.green[300],
                        ),
                        labelText: 'フレームあり、ラベルあり',
                        floatingLabelStyle: const TextStyle(fontSize: 12),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.green[100]!,
                            width: 4.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 3.0,
                          ),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.green[300],
                        ),
                        labelText: 'フレームあり、ラベルあり',
                        floatingLabelStyle: const TextStyle(fontSize: 12),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.green[100]!,
                            width: 4.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    maxLines: 6,
                    minLines: 6,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: '複数行、角フレームあり、ラベルあり',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.green,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar: RootPage(),
    );
  }
}
