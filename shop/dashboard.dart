import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl/login.dart';
import 'package:wasl/services/locator.dart';
import 'package:wasl/shop/company.dart';
import 'package:wasl/shop/locations.dart';
import 'package:wasl/shop/notifications.dart';
import 'package:wasl/shop/profile.dart';
import 'package:wasl/shop/search.dart';
import 'package:wasl/shop/settings.dart';
import 'package:wasl/shop/shopProducts.dart';
import 'package:wasl/shop/support.dart';
import 'package:wasl/states/auth_checker/cubit/auth_cubit.dart';
import 'package:wasl/states/dashboard/cubit/dashboard_cubit.dart';
import 'package:wasl/widgets/waslCompanyCard.dart';
import 'package:wasl/widgets/waslCategoryButton.dart';
import "package:wasl/shop/previousOrders.dart";

import 'cart.dart';
import 'offers.dart';
import 'orders.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey categoryKey = GlobalKey();
  GlobalKey searchKey = GlobalKey();
  double categoryHeight = 50;

  @override
  void initState() {
    super.initState();
    print(this.categoryHeight);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox renderBox =
          categoryKey.currentContext!.findRenderObject() as RenderBox;
      double categoryHeight = renderBox.size.height;
      print("flex height : " + categoryHeight.toString());

      RenderBox renderBox1 =
          searchKey.currentContext!.findRenderObject() as RenderBox;
      double categoryHeight1 = renderBox1.size.height;
      print("search height : " + categoryHeight1.toString());
      setState(() {
        if (this.categoryHeight < 51) {
          this.categoryHeight = categoryHeight1 + categoryHeight;
        }
      });
    });
  }

  int currentIndex = 2;

  List<Widget> page = [
    Center(child: Text("طلبات")),
    Center(child: Text("عروض")),
    Center(child: Text("الرئيسية")),
    Center(child: Text("البضاعة")),
    Center(child: Text("السلة")),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (context) => locator<DashboardCubit>()..getDashboardData(),
      child: BlocConsumer<DashboardCubit, DashboardState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is DashboardSuccess) {
            SnackBar(content: Text(state.user.name));
          }
        },
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              drawer: Drawer(
                child: ListView(
                  children: [
                    DrawerHeader(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: state is DashboardSuccess
                                  ? Image.network(state.user.image)
                                  : CircularProgressIndicator(),
                            ),
                          ),
                          SizedBox(height: 10),
                          state is DashboardSuccess
                              ? Text(state.user.name)
                              : CircularProgressIndicator(),
                        ],
                      ),
                    ),
                    ListTile(
                      title: Text("حسابي الشخصي"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      leading: Icon(Icons.person_2_outlined),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      title: Text("الاشعارات"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Notifications(),
                          ),
                        );
                      },
                      leading: Icon(Icons.notifications_outlined),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 0.8,
                      width: double.infinity,
                      color: Colors.grey.withValues(alpha: 0.5),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      title: Text("الطلبات السابقة"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PreviousOrders_Screen(),
                          ),
                        );
                      },
                      leading: Icon(Icons.account_balance_outlined),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      title: Text("المواقع المحفوظة"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Locations()),
                        );
                      },
                      leading: Icon(Icons.location_on_outlined),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      title: Text("الضبط العام"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Settings()),
                        );
                      },
                      leading: Icon(Icons.settings_outlined),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 0.8,
                      width: double.infinity,
                      color: Colors.grey.withValues(alpha: 0.5),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      title: Text("الدعم والتواصل"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Support()),
                        );
                      },
                      leading: Icon(Icons.phone_outlined),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    BlocProvider<AuthCubit>(
                      create: (context) => locator<AuthCubit>(),
                      child: ListTile(
                        title: Text("تسجيل الخروج"),
                        onTap: () {
                          locator<AuthCubit>().logout();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        leading: Icon(Icons.logout_outlined),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ],
                ),
              ),

              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.checklist),
                    label: "الطلبات",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.local_offer),
                    label: "العروض",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "الرئيسية",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.store),
                    label: "البضاعة",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: "السلة",
                  ),
                ],
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                    switch (index) {
                      case 0:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Orders()),
                        );
                        break;
                      case 1:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Offers()),
                        );
                        break;
                      case 2:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                        break;
                      case 3:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShopProducts(),
                          ),
                        );
                        break;
                      case 4:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Cart()),
                        );
                        break;
                    }
                  });
                },
                selectedItemColor: Color(0xFF000B5B),
                unselectedItemColor: Colors.grey,
              ),

              body: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    pinned: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on, color: Color(0xFF000A5A)),
                        SizedBox(width: 10),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            value: 1,
                            items: [
                              DropdownMenuItem(child: Text("زيونة"), value: 1),
                              DropdownMenuItem(
                                child: Text("المنصور"),
                                value: 2,
                              ),
                            ],
                            onChanged: (v) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    expandedHeight: categoryHeight,
                    toolbarHeight: categoryHeight,
                    floating: true,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Search(),
                                  ),
                                );
                              },
                              child: Container(
                                key: searchKey,
                                width:
                                    350 *
                                    (MediaQuery.of(context).size.width / 390),
                                height:
                                    42 *
                                    (MediaQuery.of(context).size.height / 844),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFFAFAFA),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: const Color(0xEEEEEEEE),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Row(
                                  spacing: 10,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(width: 10),
                                    Icon(Icons.search, color: Colors.grey),
                                    Text(
                                      'البحث في منتجات الشركات',
                                      style: TextStyle(
                                        color: const Color(0xFF646464),
                                        fontSize:
                                            16 *
                                            (MediaQuery.of(context).size.width /
                                                390),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            key: categoryKey,
                            width: double.infinity,
                            child: Center(
                              child: Wrap(
                                // key: categoryKey,
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  WaslCategoryButton(
                                    name: "غذائية",
                                    assetsImage: "assets/images/food.png",
                                    onTap: () {},
                                  ),
                                  WaslCategoryButton(
                                    name: "تجميل",
                                    assetsImage: "assets/images/beauty.png",
                                    onTap: () {},
                                  ),
                                  WaslCategoryButton(
                                    name: "قرطاسية",
                                    assetsImage: "assets/images/study.png",
                                    onTap: () {},
                                  ),
                                  WaslCategoryButton(
                                    name: "اطفال",
                                    assetsImage: "assets/images/kids.png",
                                    onTap: () {},
                                  ),
                                  WaslCategoryButton(
                                    name: "طبية",
                                    assetsImage: "assets/images/health.png",
                                    onTap: () {},
                                  ),
                                  WaslCategoryButton(
                                    name: "منزلية",
                                    assetsImage: "assets/images/homes.png",
                                    onTap: () {},
                                  ),
                                  WaslCategoryButton(
                                    name: "تبوغ",
                                    assetsImage: "assets/images/smoking.png",
                                    onTap: () {},
                                  ),
                                  WaslCategoryButton(
                                    name: "الكترونيات",
                                    assetsImage: "assets/images/electric.png",
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverList(
                    delegate: SliverChildListDelegate([
                      WaslCompanyCard(
                        image: "assets/images/pepsi_cover.png",
                        logo: "assets/images/pepsi_logo.png",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Company()),
                          );
                        },
                      ),
                      WaslCompanyCard(
                        image: "assets/images/pringls_cover.png",
                        logo: "assets/images/pringls_logo.png",
                        onTap: () {},
                      ),
                      WaslCompanyCard(
                        image: "assets/images/pepsi_cover.png",
                        logo: "assets/images/pepsi_logo.png",
                        onTap: () {},
                      ),
                      WaslCompanyCard(
                        image: "assets/images/pepsi_cover.png",
                        logo: "assets/images/pepsi_logo.png",
                        onTap: () {},
                      ),
                      WaslCompanyCard(
                        image: "assets/images/pringls_cover.png",
                        logo: "assets/images/pringls_logo.png",
                        onTap: () {},
                      ),
                      WaslCompanyCard(
                        image: "assets/images/pepsi_cover.png",
                        logo: "assets/images/pepsi_logo.png",
                        onTap: () {},
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
