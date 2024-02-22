import 'package:flutter/material.dart';

class Fourth extends StatefulWidget {
  const Fourth({Key? key}) : super(key: key);

  @override
  State<Fourth> createState() => _FourthState();
}

class _FourthState extends State<Fourth> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40,
        width: 40,
        child: FloatingActionButton(onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const Show();
              });
        }),
      ),
    );
  }
}

class Show extends StatefulWidget {
  const Show({Key? key}) : super(key: key);

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Dialog(
      child: Column(
        children: [
          Text("Herrrrreeeee"),
          Container(
              child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                Tab(
                  text: "Places",
                ),
                Tab(
                  text: "Inspirations",
                ),
              ])),
          Container(
            width: double.maxFinite,
            height: 300,
            child: TabBarView(controller: _tabController, children: [
              Text("Hiii"),
              Text("Here"),
            ]),
          ),
        ],
      ),
    );
  }
}
