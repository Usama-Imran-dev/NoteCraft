import 'package:flutter/material.dart';
import "select.dart";
import "model.dart";
import 'package:note/mic.dart';

var l = [
  Colors.yellow,
  Colors.orange,
  Colors.blueAccent,
  Colors.green,
  Colors.red,
  Colors.deepPurple,
  Colors.pink,
  Colors.grey,
  Colors.cyanAccent,
  Colors.lightGreen,
  Colors.teal,
  Colors.brown,
  Colors.indigo,
  Colors.blueGrey
];

class Shows extends StatefulWidget {
  Shows(this.n, this.h, {Key? key}) : super(key: key);
  note n;
  int h;
  @override
  ShowsState createState() => ShowsState();
}

class ShowsState extends State<Shows> {
  late Color x;
  late TextEditingController f1;
  late TextEditingController f2;
  late String bv;
  bool vb = true;
  bool xy = false;
  @override
  void initState() {
    super.initState();

    x = widget.h == 0 ? Colors.grey : widget.n.cx;
    f1 = TextEditingController(text: widget.n.headline);
    f2 = TextEditingController(text: widget.n.content);
  }

  void sel(Color cx) {
    setState(() {
      x = cx;
    });
  }

  bool check(note xc) {
    if (xc.headline == "") {
      showDialog(
          context: context,
          builder: ((context) => Center(
                  child: Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                    color: x, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Heading missing",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(
                        color: x,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        child: const Text(
                          "OK",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))));

      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.h == 0) {
      bv = "Create";
    } else {
      bv = "Update";
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (ctx) => mic(x));
              },
              icon: const Icon(
                Icons.mic,
                color: Colors.white,
                size: 35,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.speaker,
                color: Colors.white,
                size: 35,
              ))
        ],
        title: Text(bv,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w900)),
        backgroundColor: x,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 39, 38, 38),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: x.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10.0),
                      TextField(
                        controller: f1,
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.w800),
                        decoration: const InputDecoration(
                            hintText: "Heading...",
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                      TextField(
                        controller: f2,
                        maxLines: 20,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                        decoration: const InputDecoration(
                            hintText: "Content...",
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                  color: x.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: l.map((e) => Conti(e, sel)).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.width * 0.45,
              child: ElevatedButton(
                  onPressed: () {
                    note createdNote = note(f1.text, f2.text, x);
                    bool zx = check(createdNote);
                    if (zx) {
                      Navigator.of(context).pop(createdNote);
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: x),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          bv,
                          style: TextStyle(
                              color: x == Colors.white
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
