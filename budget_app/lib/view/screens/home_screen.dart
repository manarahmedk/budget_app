import 'package:budget_app/model/budget_model.dart';
import 'package:budget_app/view/components/widgets/navigation.dart';
import 'package:budget_app/view/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget_app/view/components/widgets/text_custom.dart';
import 'package:budget_app/view_model/utils/colors.dart';
import '../../view_model/bloc/budget_cubit/budget_cubit.dart';
import '../../view_model/bloc/budget_cubit/budget_states.dart';
import '../components/builders/section_builder.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = BudgetCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: TextCustom(
          text: 'Budget App',
        ),
      ),
      body: BlocConsumer<BudgetCubit, BudgetStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Visibility(
            visible: cubit.data.isNotEmpty,
            child: ListView.separated(
              itemBuilder: (context, index) => SectionBuilder(
                budgetModel: BudgetModel(
                  name: cubit.data["data"][index]['name'],
                  money_budget: cubit.data["data"][index]['money_budget'],
                  money_left: cubit.data["data"][index]['money_left'],
                ),
                onTap: () {
                  cubit.currentIndex = index;
                  Navigation.push(context, DetailsScreen(myIndex:index));
                },
              ),
              separatorBuilder: (context, index) =>const SizedBox(
                height: 8,
              ),
              itemCount: cubit.data['data'].length,
            ),
            replacement: Center(
              child: const TextCustom(
                text: 'No Items Added !',
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: AppColors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
