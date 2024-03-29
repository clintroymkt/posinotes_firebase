import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:posinotes_sqlflite/pages/contacts_page.dart';
import 'package:posinotes_sqlflite/pages/notes_page.dart';
import 'package:posinotes_sqlflite/pages/quote_page.dart';

import 'articles.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Widget> tabs = [
    //Home
     const Center(
        child: QuotesPage()
        // child: ProductsPage(),
        ),

    //NotesPage
    Center(child: NotesPage()),

    //Account
     Center(
      child: ContactsPage()
    ),

    //Logout
    Center(
      child:
          Center(child: Text("Logout", style: TextStyle(color: Colors.black))),
    ),

    //Articles
    Center(child: Articles()),

    // ProductsPage()
  ];

  int currentPage = 0;

  setPage(index) {
    setState(() {
      currentPage = index;
    });
  }
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: tabs[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.blue,
              tabBackgroundColor: Colors.grey.shade400,
              padding: EdgeInsets.all(10),
              tabs: [
            GButton(icon: Icons.format_quote, text: "Quotes",),
            GButton(icon: Icons.notes, text: "Notes",),
            GButton(icon: Icons.account_circle_outlined, text: "Account",),
            GButton(icon: Icons.article_outlined, text:"Articles"),
          ],
          onTabChange: (index) {
          setState(() {
          _selectedIndex = index;
          print(index);
          });}
        ),
      )
        
      //BottomAppBar(
      //     color: Colors.white,
      //     shape: CircularNotchedRectangle(),
      //     child: Container(
      //         height: 80,
      //         padding: EdgeInsets.symmetric(horizontal: 20),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Column(
      //               children: [
      //                 IconButton(
      //                   icon: Icon(
      //                     Icons.home,
      //                     color: currentPage == 0 ? Color(0XFF3BAAFF) : Colors.blueGrey,
      //                     size: 30,
      //                   ),
      //                   onPressed: () => setPage(0),
      //                 ),
      //                 const Text(
      //                   "Home",
      //                   style: TextStyle(
      //                       color: Color(0XFF3BAAFF), fontWeight: FontWeight.bold),
      //                 )
      //               ],
      //             ),
      //             Column(
      //               children: [
      //                 IconButton(
      //                   icon: Icon(
      //                     Icons.sticky_note_2_rounded,
      //                     color: currentPage == 1 ? Color(0XFF3BAAFF) : Colors.blueGrey,
      //                     size: 30,
      //                   ),
      //                   onPressed: () => setPage(1),
      //                 ),
      //                 const Text(
      //                   "Personal Notes",
      //                   style: TextStyle(
      //                       color: Color(0XFF3BAAFF), fontWeight: FontWeight.bold),
      //                 )
      //               ],
      //             ),
      //             // SizedBox.shrink(),
      //             Column(
      //               children: [
      //                 IconButton(
      //                     onPressed: () => setPage(4),
      //                     icon: Icon(Icons.article_rounded,
      //                         color:
      //                             currentPage == 4 ? Color(0XFF3BAAFF) : Colors.blueGrey,
      //                         size: 30)),
      //                 const Text(
      //                   "Articles",
      //                   style: TextStyle(
      //                       color: Color(0XFF3BAAFF), fontWeight: FontWeight.bold),
      //                 )
      //               ],
      //             ),
      //             Column(
      //               children: [
      //                 IconButton(
      //
      //                   icon: Icon(
      //                     Icons.account_circle,
      //                     color: currentPage == 2 ? Color(0XFF3BAAFF) : Colors.blueGrey,
      //                     size: 30,
      //                   ),
      //                   onPressed: () => setPage(2),
      //                 ),
      //                 const Text(
      //                   "Find Help",
      //                   style: TextStyle(
      //                       color: Color(0XFF3BAAFF), fontWeight: FontWeight.bold),
      //                 )
      //               ],
      //             ),
      //             // Column(
      //             //   children: [
      //             //     IconButton(
      //             //       icon: Icon(
      //             //         Icons.logout,
      //             //         color: currentPage == 3 ? Colors.grey : Colors.white,
      //             //         size: 30,
      //             //       ),
      //             //       onPressed: (){
      //             //         // navigateToLoginPage();
      //             //       },
      //             //     ),
      //             //     const Text(
      //             //       "Logout",
      //             //       style: TextStyle(
      //             //           color: Colors.white, fontWeight: FontWeight.bold),
      //             //     )
      //             //   ],
      //             // )
      //           ],
      //         ))),
      // bottomNavigationBar: FlashyTabBar(
      //   selectedIndex: currentPage,
      //   showElevation: true,
      //   onItemSelected: (index) => setState(() {
      //     currentPage = index;
      //   }),
      //   items: [
      //     FlashyTabBarItem(
      //       icon: Icon(Icons.event),
      //       title: Text('Events'),
      //     ),
      //     FlashyTabBarItem(
      //       icon: Icon(Icons.search),
      //       title: Text('Search'),
      //     ),
      //     FlashyTabBarItem(
      //       icon: Icon(Icons.highlight),
      //       title: Text('Highlights'),
      //     ),
      //     FlashyTabBarItem(
      //       icon: Icon(Icons.settings),
      //       title: Text('Settings'),
      //     ),
      //     FlashyTabBarItem(
      //       icon: Icon(Icons.settings),
      //       title: Text('한국어'),
      //     ),
      //   ],
      // ),
    ));
  }

  // navigateToLoginPage(){
  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: (BuildContext context) => const LoginPage()));
  // }
}
