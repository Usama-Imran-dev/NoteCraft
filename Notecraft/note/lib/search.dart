import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note/model.dart';
import 'package:note/nts.dart';

class search extends StatefulWidget {
  //const search({Key? key}) : super(key: key);
  search(this.p, this.s, this.sx, this.sv, {super.key});
  List<note> p;
  Function(note, int) s;
  Function(note) sx;
  Function(note) sv;
  @override
  searchState createState() => searchState();
}

//class _mainscState extends State<mainsc> {

class searchState extends State<search> {
  void update(note x, index) {
    setState(() {
      widget.p[index] = x;
    });
    widget.s(x, index);
  }

  void remove(note e) {
    setState(() {
      widget.p.remove(e);
    });
    widget.sx(e);
  }

  void archived(note x) {
    setState(() {
      widget.p.remove(x);
    });
    widget.sv(x);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(250, 30, 30, 30),
        title: const Text(
          "Search",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
          color: const Color.fromARGB(255, 39, 38, 38),
          child: widget.p.isEmpty
              ? Center(
                  child: Text(
                    "No search found try correct heading",
                    style: GoogleFonts.dancingScript(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800)),
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.9,
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: widget.p.length,
                  itemBuilder: (context, index) =>
                      Notes(widget.p[index], index, update, remove, archived),
                )),
    );
  }
}
