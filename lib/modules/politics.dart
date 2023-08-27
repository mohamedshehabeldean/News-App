import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/components.dart';
import '../shared/cubit/news_cubit.dart';
class Politics extends StatelessWidget {
  const Politics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list=NewsCubit.get(context).Politics;
        return new_builder(list,context);
      },
    );
  }
}

