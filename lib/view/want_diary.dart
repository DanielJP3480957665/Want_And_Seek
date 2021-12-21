import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:want_and_seek/root_page/root_page.dart';
import 'package:want_and_seek/model/want_diary_model/want_diary_model.dart';

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
    );
  }
}

final addWantDiaryProvider = ChangeNotifierProvider<AddWantDiary>(
  (ref) => AddWantDiary(),
);

class WantDiaryPage extends ConsumerWidget {
  const WantDiaryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wantDiary = ref.watch(addWantDiaryProvider);

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
                      onChanged: (text) {
                        wantDiary.seek = text;
                      },
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
                        labelText: 'seek今日体験した中で楽しかった事書いてみましょう',
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
                      onChanged: (text) {
                        wantDiary.want = text;
                      },
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
                        labelText: 'want　次はどんな事がですか？',
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
                      onChanged: (text) {
                        wantDiary.challenge = text;
                      },
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
                        labelText: 'challenge それらを踏まえてどんな事に挑戦していきたいですか',
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
                    onChanged: (text) {
                      wantDiary.diary = text;
                    },
                    maxLines: 6,
                    minLines: 6,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: '今日の気持ちを書いてみましょう',
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
                  ElevatedButton(
                    onPressed: () async {
                      // 追加の処理
                      try {
                        wantDiary.startLoading();
                        await wantDiary.addWantDiary();
                        Navigator.of(context).pop(true);
                      } catch (e) {
                        print(e);
                        final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(e.toString()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } finally {
                        wantDiary.endLoading();
                      }
                    },
                    child: const Text('追加する'),
                  ),
                  if (wantDiary.isLoading)
                    Container(
                      color: Colors.black12,
                      child: const CircularProgressIndicator(),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
