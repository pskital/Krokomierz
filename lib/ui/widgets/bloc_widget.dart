import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocWidget<T extends StateStreamable<dynamic>>
    extends StatelessWidget {
  const BlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return buildWidget(context, _getBloc(context));
  }

  T _getBloc(BuildContext context) => context.read<T>();

  Widget buildWidget(BuildContext context, T bloc);
}
