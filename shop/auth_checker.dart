import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl/login.dart';
import 'package:wasl/services/locator.dart';
import 'package:wasl/shop/dashboard.dart';
import 'package:wasl/states/auth_checker/cubit/auth_cubit.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => locator<AuthCubit>()..checkAuth(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AuthSuccess) {
            return Dashboard();
          } else if (state is AuthFailure) {
            return Login();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
