import 'package:ecommercial/app/app.dart';
import 'package:ecommercial/nav_pages/cubit/nav_cubit.dart';
import 'package:ecommercial/nav_pages/view/nav_view.dart';
import 'package:ecommercial/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late Image myImage;

class NavPages extends StatelessWidget {
  const NavPages({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: NavPages());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/assets/imgs/fabric2.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            actions: [
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Image(
                  image: AssetImage('assets/assets/imgs/logo1.png'),
                  height: 50,
                  width: 125,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  key: const Key('logout button'),
                  onPressed: () =>
                      context.read<AppBloc>().add(AppLogoutRequested()),
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          body: BlocProvider(
            create: (_) => NavigationCubit(),
            child: const NavView(),
          ),
        ),
      ),
    );
  }
}
