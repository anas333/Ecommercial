import 'package:auth_repo/auth_repo.dart';
import 'package:database_repo/database_repo.dart';
import 'package:ecommercial/app/bloc/auth/app_bloc.dart';
import 'package:ecommercial/app/bloc/database_bloc/database_bloc.dart';
import 'package:ecommercial/app/routes/routes.dart';
import 'package:ecommercial/theme.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
    required CloudFirestore cloudFirestore,
  })  : _authenticationRepository = authenticationRepository,
        _cloudFirestore = cloudFirestore,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;
  final CloudFirestore _cloudFirestore;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>.value(
          value: _authenticationRepository,
        ),
        RepositoryProvider<CloudFirestore>.value(
          value: _cloudFirestore,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DatabaseBloc(
              cloudFirestore: _cloudFirestore,
            ),
          ),
          BlocProvider(
            create: (context) => AppBloc(
              authenticationRepository: _authenticationRepository,
            ),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
