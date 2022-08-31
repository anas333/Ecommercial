import 'package:auth_repo/auth_repo.dart';
import 'package:database_repo/database_repo.dart';
import 'package:ecommercial/app/app.dart';

import 'package:ecommercial/cart/cart.dart';
import 'package:ecommercial/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppBlocObserver();
  final authenticationRepository = AuthenticationRepository();
  final shoppingRepository = ShoppingRepository();
  final cloudFirestore = CloudFirestore();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartBloc(shoppingRepository: shoppingRepository)
            ..add(CartStarted()),
        ),
      ],
      child: App(
        authenticationRepository: authenticationRepository,
        cloudFirestore: cloudFirestore,
      ),
    ),
  );
}
