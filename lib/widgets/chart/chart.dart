import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/chart/chart_bar.dart';
import 'package:expense_tracker/models/expense.dart';

class Chart extends StatelessWidget {
  final List<Expense> expenses;
  const Chart({super.key, required this.expenses});

  List<ExpenseBucket> get buckets {
    List<ExpenseBucket> allBuckets = List<ExpenseBucket>.empty(growable: true);
    allBuckets.add(ExpenseBucket.forCategory(
        allExpenses: expenses, category: Category.food));
    allBuckets.add(ExpenseBucket.forCategory(
        allExpenses: expenses, category: Category.leisure));
    allBuckets.add(ExpenseBucket.forCategory(
        allExpenses: expenses, category: Category.travel));
    allBuckets.add(ExpenseBucket.forCategory(
        allExpenses: expenses, category: Category.work));
    return allBuckets;
  }

  double get maxTotalExpense {
    double maxExpense = 0;
    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxExpense) {
        maxExpense = bucket.totalExpenses;
      }
    }
    return maxExpense;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
        // constraints: const BoxConstraints(minHeight: 200),
      decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.bottomCenter,
        //     end: Alignment.topCenter,
        //     colors: [
        //       Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4),
        //       Theme.of(context).colorScheme.secondaryContainer,
        //     ],
        //   ),
        borderRadius: BorderRadius.circular(10),
        color: isDarkMode
            ? Theme.of(context).colorScheme.secondaryContainer
            : Theme.of(context).colorScheme.primaryContainer.withOpacity(0.45),
      ),
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (final bucket in buckets)
            // Container(
            // height: 100,
            // margin: const EdgeInsets.symmetric(horizontal: 10),
            // child:
            Expanded(
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 15,
                      child: ChartBar(
                          fill: bucket.totalExpenses / maxTotalExpense),
                          // fill: bucket.totalExpenses / maxTotalExpense),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 20,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Icon(
                        categoryIcons[bucket.category],
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ]),
            ),
          // ),
        ],
      ),
    );
  }
}
