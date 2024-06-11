import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_app_mzizi/authentication/screen/sign_up_screen.dart';
import 'package:technical_test_app_mzizi/model/coin.dart';

import '../model/guide.dart';
import '../provider/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Coin> coinList = [];
  List<Guide> guideList = [];
  String? user;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    coinList = Coin.coinList;
    guideList = Guide.guideList;
    user = FirebaseAuth.instance.currentUser?.displayName;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<UserSignUpProvider>(context, listen: false);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu)),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(
                  width: 354,
                  child: Text(
                    "Welcome, $user.",
                    style: GoogleFonts.dmSans(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 354,
                height: 146,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Your total asset portfolio',
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "N203,935",
                          style: GoogleFonts.inter(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        const SizedBox(width: 30),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text("Invest now",
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green)))
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  ListTile(
                    title: Text(
                      "Best Plans",
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          letterSpacing: 0.8),
                    ),
                    trailing: Text(
                      'See All',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 0.8,
                          color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: coinList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10.0, // Vertical spacing
                        ),
                        itemBuilder: (context, index) {
                          final coin = coinList[index];
                          return Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    alignment: Alignment.bottomRight,
                                    image: AssetImage(
                                      coin.image,
                                    ),
                                    fit: BoxFit.scaleDown,
                                  ),
                                  gradient: coin.gradient,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: coin.gradient),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          coin.name,
                                          style: GoogleFonts.inter(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          coin.percentageReturn,
                                          style: GoogleFonts.inter(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                  )
                ],
              ),
              Column(
                children: [
                  ListTile(
                    title: Text(
                      "Investment Guide",
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          letterSpacing: 0.8,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                        itemCount: guideList.length,
                        itemBuilder: (context, index) {
                          final guide = guideList[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  guide.title,
                                  style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      letterSpacing: 0.8,
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  guide.subtitle,
                                  style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      letterSpacing: 0.8,
                                      color: Colors.black87),
                                ),
                                trailing: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      guide.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          );
                        }),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange_outlined),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
      drawer: Drawer(
        width: 200,
        child: ListView(
         // padding: EdgeInsets.zero,
          children: [
            Container(
              height:50 ,
              child: DrawerHeader(
                child: Text(
                  '',
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                authProvider.deleteUserCredentials(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
