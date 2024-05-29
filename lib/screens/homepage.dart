import 'dart:ui';
import 'package:assignment_schaffen_softwares/reusable/albums.dart';
import 'package:assignment_schaffen_softwares/screens/readmore.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../reusable/iconswithtext.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  late ScrollController _scrollController;
  bool displaygenre = false;
  double appBarHeight = 60.0;
  Color _textColor = Colors.blue;

  @override
  final List<String> strings = [
    'outdoor',
    'outdoor1',
    'outdoor2',
    'outdoor3',
    'outdoor',
    'outdoor1',
    'outdoor2',
    'outdoor3',
  ];
  final List<Map<String, dynamic>> _allUsers = [
    {"country": "india", "name": "Andy", "age": 29},
    {"country":"india", "name": "Aragon", "age": 40},
    {"country": "india", "name": "Bob", "age": 5},
    {"country": "india", "name": "Barbara", "age": 35},
    {"country": "india", "name": "Candy", "age": 21},
    {"country": "india", "name": "Colin", "age": 55},
    {"country": "india", "name": "Audra", "age": 30},
    {"country": "india", "name": "Banana", "age": 14},
    {"country": "india", "name": "Caversky", "age": 100},
    {"country": "india", "name": "Becky", "age": 32},
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  void initState() {
    _foundUsers = _allUsers;
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        _updateTextColor();
      });
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();

    }
    setState(() {
      _foundUsers = results;
    });
  }

  void _updateTextColor() {
    if (_scrollController.hasClients) {
      setState(() {
        _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.blue;
      });
    }
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  void updatelist(String value) {}

  @override
  Widget build(BuildContext context) {
    var key1 = GlobalKey();
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 250,
            backgroundColor: Color(0xFFC32422),
            titleSpacing: 0,
            leading: IconButton(
                onPressed: () {
                  // Implement navigation or functionality
                },
                icon: Icon(
                  Icons.keyboard_backspace_rounded,
                  color: Colors.white,
                  size: 20,
                )),
            title: _isSliverAppBarExpanded
                ? Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/weekend.png',
                          fit: BoxFit.cover,
                          height: 45.0,
                          width: 45.0,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            Text(
                              "The weekend",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Text("Community • 11k streams",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white)),
                            Spacer(),
                          ],
                        ),
                      )
                    ],
                  )
                : null,
            actions: _isSliverAppBarExpanded
                ? [
                    Container(decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(50.0),),padding: EdgeInsets.zero,
                      child: IconButton(
                          onPressed: () {
                            displayBottomSheet(context);
                          },
                          icon: Icon(
                            Icons.more_vert_rounded,
                            color: Colors.white,
                            size: 20,
                          )),
                    ),
                  ]
                : null,
            flexibleSpace: _isSliverAppBarExpanded
                ? null
                : FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Image.asset(
                      'assets/weekend.png',
                      fit: BoxFit.cover,
                    ),
                    titlePadding: EdgeInsets.zero,
                    title: Container(
                      height: 40.0,
                      color: Color(0xFFC32422),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Spacer(),
                                  Text("The weekend",
                                      style: TextStyle(fontSize: 14)),
                                  Text("Community • 11k streams",
                                      style: TextStyle(fontSize: 8)),
                                  Spacer(),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                // Implement sharing functionality
                              },
                              icon: Icon(
                                Icons.share_rounded,
                                color: Colors.white,
                                size: 14,
                              )),
                        ],
                      ),
                    ),
                  ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  readmore(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  ),
                  SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Wrap(
                          spacing: 8.0,
                          children: strings
                              .take(displaygenre ? strings.length : 4)
                              .map((string) {
                            return ElevatedButton(
                              onPressed: () {
                                // Add your onPressed logic here
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 0.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(color: Color(0xFFEF456F)),
                                ),
                              ),
                              child: Text(
                                string,
                                style: TextStyle(
                                    fontSize: 10.0, color: Color(0xFFEF456F)),
                              ),
                            );
                          }).toList(),
                        ),
                        if (!displaygenre && strings.length > 4)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                displaygenre = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 18,
                                  color: Color(0xFFEF456F),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    "${strings.length - 4}", // Number of remaining strings
                                    style: TextStyle(
                                      color: Color(0xFFEF456F),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Media, docs and links",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            // Implement navigation or functionality
                          },
                          icon: Icon(
                            Icons.navigate_next,
                            size: 25,
                          )),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 24,
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10, //change here
                      itemBuilder: (BuildContext context, int index) {
                        return albums(
                          albumimage: "assets/weekend.png",
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mute notification",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 25,
                        child: ToggleSwitch(
                          minWidth: 30.0,
                          cornerRadius: 50.0,
                          activeBgColors: [
                            [Color(0XFFAAABAB)!],
                            [Color(0xFFC32422)!]
                          ],
                          inactiveBgColor: Colors.grey.shade300,
                          initialLabelIndex: 1,
                          totalSwitches: 2,
                          radiusStyle: true,
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  IconWithText(
                    iconData: Icons.delete,
                    text: "Clear Chat",
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  IconWithText(
                    iconData: Icons.lock,
                    text: "Encryption",
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  IconWithText(
                    iconData: Icons.exit_to_app_rounded,
                    text: "Exit Comminity",
                    iconColor: Colors.red,
                    iconSize: 24.0,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFFC32422)),
                  ),
                  SizedBox(height: 8),
                  IconWithText(
                    iconData: Icons.thumb_down_alt_rounded,
                    text: "Report",
                    iconColor: Colors.red,
                    iconSize: 24.0,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFFC32422)),
                  ),
                  SizedBox(key: key1,height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _isSearching
                          ? Expanded(
                              child: Container(
                                child: TextField(
                                  onChanged: (value) => _runFilter(value),
                                  controller: _searchController,
                                  decoration: InputDecoration(
                                    hintText: 'Search member',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                ),
                                height: 45,
                              ),
                            )
                          : Text(
                              "Members",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                      _isSearching
                          ? TextButton(
                              onPressed: () {
                                setState(() {
                                  _isSearching = false;
                                  _searchController.clear();
                                });
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                Scrollable.ensureVisible(key1.currentContext!);
                                setState(() {
                                  _isSearching = true;
                                });
                              },
                              icon: Icon(
                                Icons.search_rounded,
                                size: 25,
                              ),
                            ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 24,
                    height: MediaQuery.of(context).size.height*0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _foundUsers.isNotEmpty
                              ? ListView.builder(
                                  itemCount: _foundUsers.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        ClipOval(
                                          child: Image.asset(
                                            'assets/weekend.png',
                                            fit: BoxFit.cover,
                                            height: 45.0,
                                            width: 45.0,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Container(
                                            height: 45,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align content vertically
                                              children: [
                                                Text(
                                                  _foundUsers[index]['name'],
                                                ),
                                                Text(
                                                  '${_foundUsers[index]["age"].toString()}, ' +
                                                      '${_foundUsers[index]["country"]}.',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Implement your button tap logic here
                                          },
                                          child: Text("Add",style: TextStyle(color: Colors.white),),
                                          style: ElevatedButton.styleFrom(
                                            fixedSize: Size(120, 30), // Set button size explicitly
                                            backgroundColor: Color(0xFFEF456F), // Set button color
                                          ),
                                        ),
                                      ],
                                    ),

                                  ))
                              : const Text(
                                  'No results found',
                                  style: TextStyle(fontSize: 16),
                                ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: MediaQuery.of(context).size.height/3.5,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconWithText(
                  iconData: Icons.link,
                  text: "Invite",
                  iconColor: Colors.black,
                  iconSize: 24.0,
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconWithText(
                  iconData: Icons.person_add_alt_1_rounded,
                  text: "Add member",
                  iconColor: Colors.black,
                  iconSize: 24.0,
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconWithText(
                  iconData: Icons.group_add_rounded,
                  text: "Add group",
                  iconColor: Colors.black,
                  iconSize: 24.0,
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                ),
              ),
            ],
          ),
            ));
  }
}
