import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<BlocProvider>? providers = onCreateBlocProviders(context);
    final Widget view = onCreateView(context);
    if (providers == null || providers.isEmpty) {
      return view;
    } else {
      return MultiBlocProvider(providers: providers, child: view);
    }
  }

  List<BlocProvider>? onCreateBlocProviders(BuildContext context) {
    return null;
  }

  Widget onCreateView(BuildContext context);
}
