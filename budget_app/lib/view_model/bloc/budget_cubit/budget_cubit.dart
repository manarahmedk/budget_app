import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../model/budget_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'budget_states.dart';

class BudgetCubit extends Cubit<BudgetStates>{

  BudgetCubit() : super(BudgetInitialState());

  static BudgetCubit get(context)=>BlocProvider.of<BudgetCubit>(context);

  int currentIndex=0;

  Map<String,dynamic> data={
    "data":[{
      "name":"Groceries",
      "money_budget":400,
      "money_left":21,
      "transactions":[
        {
          "name":"tasco",
          "value":8.99,
        },
        {
          "name":"pet shop",
          "value":11.30,
        },
      ]
    },
    {
      "name":"Bills",
      "money_budget":500,
      "money_left":28,
      "transactions":[
        {
          "name":"Electricity",
          "value":150.50,
        },
        {
          "name":"Gas",
          "value":87.30,
        },
      ]
    },
    ]
  };

}