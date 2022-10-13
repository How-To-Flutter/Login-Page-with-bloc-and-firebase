import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_/auth/auth.dart';
import 'package:login_page_/bloc/app_bloc.dart';
import 'package:login_page_/views/home_view/home_view.dart';
import 'package:login_page_/views/welcome_view/welcome_view.dart';

class ScreenController extends StatelessWidget {
  const ScreenController({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if(state is AppStateLoggedIn){
              return HomeView();
            }
            if(state is AppStateLoggedOut){
              return WelcomeView();
            } else {
                          return Container();
            }
          },
        );
      },
    );
  }
}