import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/radio/radio_list.dart';
import 'package:islamiapp/tabs/radio/reciters_list.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppTheme.black.withValues(alpha: 0.70),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                labelStyle: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: AppTheme.black),
                unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
                dividerColor: Colors.transparent,

                indicator: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),

                indicatorSize: TabBarIndicatorSize.tab,

                tabs: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 11, horizontal: 22),
                    child: Text("Radio"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 11, horizontal: 22),
                    child: Text("Reciters"),
                  ),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [
                  ListView.separated(
                    itemBuilder: (_, _) => RadioList(),
                    separatorBuilder: (_, _) => SizedBox(height: 8),
                    itemCount: 10,
                  ),

                  ListView.separated(
                    itemBuilder: (_, _) => RecitersList(),
                    separatorBuilder: (_, _) => SizedBox(height: 8),
                    itemCount: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
