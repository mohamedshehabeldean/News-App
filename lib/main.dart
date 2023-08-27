import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nenow/network/remote/dio_helper.dart';
import 'package:nenow/shared/bloc_observer.dart';
import 'package:nenow/shared/cubit/news_cubit.dart';
import 'layout/home_layout.dart';
import 'network/local/cache_helper.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();//بيضمن ان قبل الmain يتنفذ قبل
  // ال run
  Bloc.observer = MyBlocObserver();
  dioHelper.init();
  await CacheHelper.init();
  bool? changeiconmode=CacheHelper.getData(key:'changeiconmode');
  runApp(MyApp(changeiconmode));
}


class MyApp extends StatelessWidget {
  final bool? changeiconmode;
  MyApp(this.changeiconmode);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getSports()..getBusiness()
        ..getScience()..getPolitics()..iconMode(fromShared:changeiconmode ),//بدل
      // init state,
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            //light
            theme: ThemeData(
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black
                  ),
                  bodyText2: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)

              ),
              primarySwatch: Colors.red,
              //collor of circleprogressindicator
              scaffoldBackgroundColor: Colors.white,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                  iconSize: 40.0,
                  elevation: 0.0
              ),

              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                    color: Colors.black,
                    size: 32
                ),

                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.dark,
                    statusBarColor: Colors.white,
                    systemNavigationBarColor: Colors.white),
                // backgroundColor: Colors.white,
                titleSpacing: 70.0,
                elevation: 0.0,
              ),

            ),
            //dark
            darkTheme: ThemeData(
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white
                    ),
                    bodyText2: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)

                ),

                primarySwatch: Colors.red,
                //collor of circleprogressindicator
                scaffoldBackgroundColor: Color(0xff333739),
                appBarTheme: AppBarTheme(
                  backgroundColor: Color(0xff333739),
                  iconTheme: IconThemeData(
                      color: Colors.white,
                      size: 32
                  ),

                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.light,
                      statusBarColor: Color(0xff333739),
                      systemNavigationBarColor: Colors.white),
                  titleSpacing: 70.0,
                  elevation: 0.0,
                ),
                drawerTheme: DrawerThemeData(
                  backgroundColor: Color(0xff333739),

                )

            ),
            themeMode: NewsCubit.get(context).changeiconmode?ThemeMode
                .light:ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            home: mainScreen(),
          );
        },
      ),
    );
  }

}