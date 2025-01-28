import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnriverpod/futureprovider.dart';
import 'package:learnriverpod/models/usermodel.dart';
import 'package:learnriverpod/provider_stfl_consumer.dart';
import 'package:learnriverpod/provider_stls_consumer1.dart';
import 'package:learnriverpod/provider_stls_consumer2.dart';
import 'package:learnriverpod/state_notifier_provider.dart';
import 'package:learnriverpod/stateprovider.dart';
import 'package:learnriverpod/streamprovider.dart';
import 'package:learnriverpod/task/home.dart';
import 'package:learnriverpod/task/photo_provider.dart';

import 'api.dart';

final nameProvider=Provider<String>((ref) {
  return "Hello Hasna";
},);

final counterProvider=StateProvider<int>(
      (ref) =>0 ,
);

final counterDemo=StateNotifierProvider<CounterDemo,int>((ref) => CounterDemo(),);

final apiProvider=Provider<ApiService>((ref) => ApiService(),);
final userDataProvider=FutureProvider<List<UserModel>>((ref) {
  return ref.read(apiProvider).getUser();
} ,);

final streamProvider=StreamProvider<int>((ref) {
  return Stream.periodic(const Duration(seconds: 2),(computationCount) => computationCount,);
},);

final photoProvider = ChangeNotifierProvider((ref) => PhotoProvider());

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await FlutterDownloader.initialize(debug: true);
  runApp( const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        theme: ThemeData(),
      debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}


