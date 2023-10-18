import 'package:flutter/material.dart';
import 'package:budget_app/view/components/widgets/text_custom.dart';
import 'package:budget_app/view_model/utils/colors.dart';
import '../../../model/budget_model.dart';
import '../../../model/details_model.dart';
import '../../../view_model/bloc/budget_cubit/budget_cubit.dart';

class DetailsBuilder extends StatelessWidget {

  TransactionsModel transactionModel;
  void Function()? onTap;

  DetailsBuilder({required this.transactionModel,this.onTap});

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
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.grey.withOpacity(0.25),
          ),
          padding: EdgeInsets.all(15),
          child: ListTile(
            title: TextCustom(
              text: transactionModel.name??'',
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColors.black,
            ),
            trailing: TextCustom(
              text: "- \$"+transactionModel.price.toString(),
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
