import 'package:fic4_tugas_akhir_ekatalog/bloc/login/login_bloc.dart';
import 'package:fic4_tugas_akhir_ekatalog/bloc/product/create_product/create_product_bloc.dart';
import 'package:fic4_tugas_akhir_ekatalog/bloc/product/get_all_product/get_all_product_bloc.dart';
import 'package:fic4_tugas_akhir_ekatalog/bloc/profile/profile_bloc.dart';
import 'package:fic4_tugas_akhir_ekatalog/bloc/register/register_bloc.dart';
import 'package:fic4_tugas_akhir_ekatalog/data/datasources/auth_datasources.dart';
import 'package:fic4_tugas_akhir_ekatalog/data/datasources/product_datasources.dart';
import 'package:fic4_tugas_akhir_ekatalog/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => CreateProductBloc(ProductDatasources()),
        ),
        BlocProvider(
          create: (context) => GetAllProductBloc(ProductDatasources()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Katalog',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
