import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/business.dart';
import '../modules/science.dart';
import '../modules/politics.dart';
import '../modules/search.dart';
import '../modules/settings.dart';
import '../modules/sports.dart';
import '../shared/components/components.dart';
import '../shared/cubit/news_cubit.dart';

class mainScreen extends StatelessWidget {
  List<Widget> _screens = [
    Sports(),
    Business(),
    Science(),
    Politics(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);

        return Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage("assets/images/sabry.jpeg"),
                          ),
                          SizedBox(
                            width: 140,
                          ),

                          IconButton(
                            icon: Icon(cubit.changeiconmode
                                ? Icons.dark_mode_rounded
                                : Icons.light_mode_outlined),
                            onPressed: () {
                              cubit.iconMode();
                              // final snakebar=SnackBar(content: Text("You Are Now "
                              //     "In Dark Mode"));
                              print(cubit.changeiconmode);
                            },
                          ),
                          // SizedBox(width: 15,),
                          // Icon(Icons.light_mode),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text("Moahmed Sabry",
                              style: Theme.of(context).textTheme.bodyText1),
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 35,
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black87,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 30,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("01069494171",
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            size: 30,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Cairo",
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.save_rounded,
                            size: 30,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("saved Messages",
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Settings()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings,
                              size: 30,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Settings",
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: Row(
              children: [
                Text(
                  "News",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Cloud",
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateto(context,Search());
                  },
                  icon: Icon(Icons.search_rounded))
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor:
                cubit.changeiconmode ? Colors.blueAccent : Colors.white,
            color: cubit.changeiconmode ? Colors.white : Color(0xff333739),
            animationDuration: Duration(milliseconds: 350),
            items: items(context),
            onTap: (index) {
              cubit.changeNavigationButtom(index);
            },
            height: 76.0,
          ),
          body: _screens[cubit.ind],
        );
      },
    );
  }



  List<CurvedNavigationBarItem> items(context) {
    return [
      CurvedNavigationBarItem(
        labelStyle: Theme.of(context).textTheme.bodyText2,
        child: Icon(Icons.sports_football),
        label: 'Sports',
      ),
      CurvedNavigationBarItem(
        labelStyle: Theme.of(context).textTheme.bodyText2,
        child: Icon(Icons.business_center_rounded),
        label: 'Business',
      ),
      CurvedNavigationBarItem(
        labelStyle: Theme.of(context).textTheme.bodyText2,
        child: Icon(Icons.science_outlined),
        label: 'Science',
      ),
      CurvedNavigationBarItem(
        labelStyle: Theme.of(context).textTheme.bodyText2,
        child: Icon(Icons.local_police),
        label: 'Politics',
      ),
    ];
  }
}
