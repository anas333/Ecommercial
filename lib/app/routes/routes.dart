import 'package:ecommercial/app/bloc/auth/app_bloc.dart';
import 'package:ecommercial/login/view/login_page.dart';
import 'package:ecommercial/nav_pages/view/nav_pages.dart';
import 'package:flutter/widgets.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [NavPages.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
