import 'search.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'showx.dart';
import 'model.dart';
import "nts.dart";
import 'help.dart';
import 'package:note/delete.dart';
import 'package:note/archived.dart';
import 'package:note/privacy.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(
    home: mainsc(),
    debugShowCheckedModeBanner: false,
  ));
}

class mainsc extends StatefulWidget {
  const mainsc({Key? key}) : super(key: key);
  @override
  _mainscState createState() => _mainscState();
}

class _mainscState extends State<mainsc> {
  late Timer timer;
  int x = 1;
  List<note> l = [];
  void sec() {
    Timer(const Duration(seconds: 4), () {
      setState(() {
        x = 2;
      });
    });
  }

  void next() async {
    var s = note("", "", Colors.transparent);

    note? createdNote = await Navigator.of(context)
        .push<note>(MaterialPageRoute(builder: (context) => Shows(s, 0)));

    if (createdNote != null) {
      setState(() {
        l.add(createdNote);
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          "note added",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        duration: Duration(seconds: 2),
      ));
    }
  }

  List<Map<String, dynamic>> del = [];
  void remove(note e) {
    setState(() {
      l.remove(e);
      del.add({"note": e, "index": l.indexOf(e)});
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        "note deleted",
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
      duration: Duration(seconds: 2),
    ));
  }

  reisert(note x, int index) {
    setState(() {
      del.removeWhere((item) => item["note"] == x);
      l.add(x);
    });
  }

  void update(note x, index) {
    setState(() {
      l[index] = x;
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        "note updated",
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
      duration: Duration(seconds: 2),
    ));
  }

  List<note> zx = [];
  void archived(note x) {
    zx.add(x);
    setState(() {
      l.remove(x);
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        "note archived",
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
      duration: Duration(seconds: 2),
    ));
  }

  re(note n) {
    setState(() {
      zx.remove(n);
      l.add(n);
    });
  }

  var v = TextEditingController();
  List<note> p = [];
  var b = [];
  @override
  Widget build(BuildContext context) {
    sec();
    return (x == 1)
        ? const Scaffold(
            body: intro(),
          )
        : Scaffold(
            drawer: Drawer(
              backgroundColor: Colors.black,
              width: 200,
              child: ListView(
                children: [
                  DrawerHeader(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Container(
                        height: 200,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "NoteCraft",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "create read update",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 43, 42, 42),
                          alignment: AlignmentDirectional.centerStart,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DeleteX(del, reisert)));
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30,
                        ),
                        label: const Text(
                          "Delete",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            alignment: AlignmentDirectional.centerStart,
                            backgroundColor:
                                const Color.fromARGB(255, 43, 42, 42)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => archivedx(zx, re)));
                        },
                        icon: const Icon(
                          Icons.archive_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        label: const Text(
                          "Archived",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            alignment: AlignmentDirectional.centerStart,
                            backgroundColor:
                                const Color.fromARGB(255, 43, 42, 42)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const privacy()));
                        },
                        icon: const Icon(
                          Icons.privacy_tip,
                          color: Colors.white,
                          size: 20,
                        ),
                        label: const Text(
                          "privacy",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            alignment: AlignmentDirectional.centerStart,
                            backgroundColor:
                                const Color.fromARGB(255, 43, 42, 42)),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (ctx) => help()));
                        },
                        icon: const Icon(
                          Icons.help_center,
                          color: Colors.white,
                          size: 20,
                        ),
                        label: const Text(
                          "Help support",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        )),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        if (v.text.isNotEmpty) {
                          p = l
                              .where((element) => element.headline
                                  .toUpperCase()
                                  .contains(v.text.toUpperCase()))
                              .toList();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) =>
                                  search(p, update, remove, archived)));
                        }
                      },
                      icon: const Icon(Icons.search))
                ],
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: const Color.fromARGB(250, 30, 30, 30),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: v,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        label: Text(
                          "keep track of notes",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                        border: InputBorder.none),
                  ),
                )),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: const Color.fromARGB(255, 39, 38, 38),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          if (l.isEmpty)
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.hourglass_empty_rounded,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  Text(
                                    "Nothing to show..",
                                    style: GoogleFonts.dancingScript(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 35,
                                            fontWeight: FontWeight.w700)),
                                  )
                                ],
                              ),
                            ),
                          const SizedBox(
                            height: 40,
                          ),
                          GridView.builder(
                              itemCount: l.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.9,
                                crossAxisCount: 2,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2,
                              ),
                              itemBuilder: (context, index) => Notes(
                                  l[index], index, update, remove, archived)),
                          Positioned(
                            right: 20,
                            bottom: 27,
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color.fromARGB(255, 43, 41, 41),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    next();
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.yellowAccent,
                                    size: 25,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
  }
}

class intro extends StatelessWidget {
  const intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 24, 22, 22),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo.png",
            fit: BoxFit.cover,
            width: 200,
            height: 200,
          ),
          Text("NoteCraft",
              style: GoogleFonts.dancingScript(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w400))),
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create read update",
                    style: GoogleFonts.dancingScript(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.w400)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
