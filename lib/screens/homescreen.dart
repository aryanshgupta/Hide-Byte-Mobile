import 'package:flutter/material.dart';
import 'package:hide_byte/constant.dart';
import 'package:hide_byte/screens/embed/embed_option.dart';
import 'package:hide_byte/screens/extract/extract_option.dart';
import 'package:hide_byte/screens/password_generator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          title: Text(
            "HideBytes",
            style: TextStyle(
              fontSize: 25.0,
              color: colorTextLight,
            ),
          ),
        ),
        body: [EmbedOption(), ExtractOption()][_currentPageIndex],
        drawer: Drawer(
          backgroundColor: colorDisabled,
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: colorPrimary,
                ),
                child: Center(
                  child: Text(
                    'HideBytes',
                    style: TextStyle(
                      color: colorTextDark,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.password_rounded),
                title: Text('Generate Password'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PasswordGeneratorScreen(
                        returnGeneratedPassword: false,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.palette_rounded),
                title: Text('Theme'),
                onTap: () {},
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          selectedIndex: _currentPageIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.lock_rounded),
              label: 'Embed',
            ),
            NavigationDestination(
              icon: Icon(Icons.lock_open_rounded),
              label: 'Extract',
            ),
          ],
        ),
      ),
    );
  }
}
