import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_app_bloc/cubits/todo_search/todo_search_cubit.dart';
import 'package:todo_app_bloc/models/todo_model.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              label: Text('Search Task'),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search)),
          onChanged: (String search) {
            if (search.isNotEmpty) {
              BlocProvider.of<TodoSearchCubit>(context).setSearchTerm(search);
            }
          },
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: filterButton(context, Filter.all)),
            SizedBox(
              width: 5,
            ),
            Expanded(child: filterButton(context, Filter.active)),
            SizedBox(
              width: 5,
            ),
            Expanded(child: filterButton(context, Filter.completed)),
          ],
        )
      ],
    );
  }
}

Widget filterButton(BuildContext context, Filter filter) {
  return Container(
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: textColor(context, filter)))),
    child: TextButton(
        style: TextButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            foregroundColor: Colors.white),
        onPressed: () {
          context.read<TodoFilterCubit>().changeFilter(filter);
        },
        child: Text(
          filter == Filter.all
              ? 'All'
              : filter == Filter.active
                  ? 'Active'
                  : 'Completed',
          style: TextStyle(color: textColor(context, filter)),
        )),
  );
}

Color textColor(BuildContext context, Filter filter) {
  final currentFilter = context.watch<TodoFilterCubit>().state.filter;
  return currentFilter == filter ? Colors.blue : Colors.grey;
}
