import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/components.dart';
import '../shared/cubit/news_cubit.dart';

class Search extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list =NewsCubit.get(context).Search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: textFormField(
context: context,
                    controller: searchController,
                    type: TextInputType.text,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Search must not be empty';
                      }
                      return null;
                    },
                    label: "Search",
                    onchanged: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    Prefix: Icons.search_rounded),

              ),
              Expanded(child: new_builder(list, context,isSearch:true)),


        ],
          ),
        );
      },
    );
  }
}
