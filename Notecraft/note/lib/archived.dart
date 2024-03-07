import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note/model.dart';

class archivedx extends StatefulWidget {
  final List<note> l;
  final Function(note x) f;

  const archivedx(this.l, this.f, {Key? key}) : super(key: key);

  @override
  _archivedxState createState() => _archivedxState();
}

class _archivedxState extends State<archivedx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(250, 30, 30, 30),
        title: const Text(
          "Archived",
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
                    Icons.archive_sharp,
                    color: Colors.white,
                    weight: 10,
                    size: 100,
                  ),
                  Text("Nothing here empty archived",
                      style: GoogleFonts.dancingScript(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w500))),
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
                  final note = widget.l[index];

                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () => setState(() {
                        widget.f(note);
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
                                "Tap to Unarchived",
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
