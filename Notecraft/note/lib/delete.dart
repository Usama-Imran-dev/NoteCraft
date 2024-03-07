import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note/model.dart';

class DeleteX extends StatefulWidget {
  final List<Map<String, dynamic>> l;
  final Function(note x, int) f;

  const DeleteX(this.l, this.f, {Key? key}) : super(key: key);

  @override
  _DeleteXState createState() => _DeleteXState();
}

class _DeleteXState extends State<DeleteX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(250, 30, 30, 30),
        title: const Text(
          "Delete",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 39, 38, 38),
        height: double.infinity,
        width: double.infinity,
        child: widget.l.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.delete_outline_sharp,
                    color: Colors.white,
                    weight: 10,
                    size: 100,
                  ),
                  Text(
                    "Nothing here empty bin",
                    style: GoogleFonts.dancingScript(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              )
            : GridView.builder(
                itemCount: widget.l.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.9,
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  final note = widget.l[index]["note"];
                  final noteIndex = widget.l[index]["index"];

                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () => setState(() {
                        widget.f(note, noteIndex);
                      }),
                      child: Transform.rotate(
                        angle: -0.09,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: note.cx.withOpacity(0.6),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "pngegg.png",
                                height: 30,
                                width: 30,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                note.headline.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                  color: note.cx.withOpacity(0.8),
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const Divider(
                                thickness: 0.09,
                                color: Colors.black,
                              ),
                              const Text(
                                "Tap to restore",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
