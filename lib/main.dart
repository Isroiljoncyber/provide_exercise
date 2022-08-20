import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/providers/view_model.dart';
import 'package:provide_exercise/domain/repos/network_repo_impl.dart';
import 'package:provide_exercise/ui/home_page.dart';
import 'package:provide_exercise/utils/constants.dart';
import 'package:provide_exercise/utils/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ViewModel>(
            create: (_) => ViewModel(NetworkRepoImpl()))
      ],
      child: MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.grey,
              unselectedWidgetColor: checkBoxClr),
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
          onGenerateRoute: (setting) => Routes.generateRoute(setting)),
    );
  }
}
