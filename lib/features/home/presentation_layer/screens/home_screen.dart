import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/dependencies/locator.dart';
import 'package:wasl_market_app/core/widgets/search_bar.dart';
import 'package:wasl_market_app/features/home/presentation_layer/providers/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchInput(height: 50),
        BlocProvider(
          create: (context) => getIt<HomeCubit>()..getProductsAndCompanies(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return state is HomeSuccess
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: (state).companies.companies.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              (state).companies.companies[index].name,
                            ),
                          );
                        },
                      ),
                    )
                  : const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
