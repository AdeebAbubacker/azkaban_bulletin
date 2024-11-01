import 'package:azkaban_bulletin/data/repositories/auth_repo.dart';
import 'package:azkaban_bulletin/data/repositories/categories_repo.dart';
import 'package:azkaban_bulletin/data/repositories/posts_repo.dart';
import 'package:azkaban_bulletin/data/repositories/repositories.dart';
import 'package:azkaban_bulletin/data/repositories/tags_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/themes/app_themes.dart'; 
import 'presentation/routers/router_import.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(RepositoryProvider(
    create: (context) => Repositories(tagsRepo: TagsRepo(), postsRepo: PostsRepo(), authRepo: AuthRepo(), categoriesRepo: CategoriesRepo(),),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter(); 

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'AzkabanBulletin',
            theme: AppThemes.dark, 
            routerConfig:
                _appRouter.config(),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
