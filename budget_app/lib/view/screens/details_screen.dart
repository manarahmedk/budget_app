import 'package:budget_app/model/budget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget_app/view/components/widgets/text_custom.dart';
import 'package:budget_app/view_model/utils/colors.dart';
import '../../model/details_model.dart';
import '../../view_model/bloc/budget_cubit/budget_cubit.dart';
import '../../view_model/bloc/budget_cubit/budget_states.dart';
import '../components/builders/details_builder.dart';
import '../components/builders/section_builder.dart';

class DetailsScreen extends StatelessWidget {
  int myIndex;

  DetailsScreen({required this.myIndex});

  @override
  Widget build(BuildContext context) {
    var cubit = BudgetCubit.get(context);
    var transaction=cubit.data["data"][myIndex]["transactions"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: TextCustom(
          text: 'Details',
        ),
      ),
      body: BlocConsumer<BudgetCubit, BudgetStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              SectionBuilder(
                budgetModel: BudgetModel(
                  name: cubit.data["data"][myIndex]['name'],
                  money_budget: cubit.data["data"][myIndex]['money_budget'],
                  money_left: cubit.data["data"][myIndex]['money_left'],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => DetailsBuilder(
                    transactionModel : TransactionsModel(
                      name: transaction[index]["name"],
                      price: transaction[index]["value"],
                    ),
                  ),
                  separatorBuilder: (context, index) =>const SizedBox(
                    height: 8,
                  ),
                  itemCount: cubit.data['data'][myIndex]['transactions'].length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
