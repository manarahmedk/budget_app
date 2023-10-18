import 'package:flutter/material.dart';
import 'package:budget_app/view/components/widgets/text_custom.dart';
import 'package:budget_app/view_model/utils/colors.dart';
import '../../../model/budget_model.dart';
import '../../../view_model/bloc/budget_cubit/budget_cubit.dart';

class SectionBuilder extends StatelessWidget {
  BudgetModel budgetModel;
  void Function()? onTap;

  SectionBuilder({required this.budgetModel,this.onTap});

  @override
  Widget build(BuildContext context) {
    var cubit = BudgetCubit.get(context);
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.grey.withOpacity(0.25),
          ),
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(
                text: budgetModel.name??"",
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColors.grey,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  TextCustom(
                    text: "\$"+budgetModel.money_budget.toString(),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppColors.black,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const TextCustom(
                    text: "/",
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppColors.grey,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  TextCustom(
                    text: "\$"+budgetModel.money_left.toString(),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppColors.grey,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              TextCustom(
                text: "- \$"+"${budgetModel.money_budget!-budgetModel.money_left!}",
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColors.pink,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
