import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provide_exercise/domain/blocs/galleryBloc/gallery_bloc.dart';
import 'package:provide_exercise/domain/blocs/newsDetailedBloc//news_detailed_bloc.dart';
import 'package:provide_exercise/domain/blocs/photosBloc/photos_bloc.dart';
import 'package:provide_exercise/domain/blocs/profileCubit/profile_cubit.dart';
import 'package:provide_exercise/domain/blocs/todosBloc/todos_bloc.dart';
import 'package:provide_exercise/ui/home_page.dart';
import 'package:provide_exercise/utils/constants.dart';
import 'package:provide_exercise/utils/routes.dart';

import 'domain/blocs/newsBloc/news_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(create: (_) => NewsBloc()),
        BlocProvider<NewsDetailedBloc>(create: (_) => NewsDetailedBloc()),
        BlocProvider<GalleryBloc>(create: (_) => GalleryBloc()),
        BlocProvider<PhotosBloc>(create: (_) => PhotosBloc()),
        BlocProvider<TodosBloc>(create: (_) => TodosBloc()),
        BlocProvider<ProfileCubit>(create: (_) => ProfileCubit()),
      ],
      child: MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.grey, unselectedWidgetColor: checkBoxClr),
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
          onGenerateRoute: (setting) => Routes.generateRoute(setting)),
    );
  }
}
