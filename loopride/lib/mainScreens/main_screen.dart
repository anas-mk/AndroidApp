import 'package:flutter/material.dart';
import 'package:loopride/tabPages/earning_tab.dart';
import 'package:loopride/tabPages/home_tab.dart';
import 'package:loopride/tabPages/profile_tab.dart';
import 'package:loopride/tabPages/rating_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {

  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index)
  {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          HomeTabPage(),
          EarningTabPage(),
          RatingTabPage(),
          ProfileTabPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: "Earning",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Rating",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: " Profile",
            ),
          ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize:14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
