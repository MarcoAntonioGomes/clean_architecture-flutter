import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/screens/details.dart';
import 'package:hyrule/themes/theme_colors.dart';

class EntryCard extends StatelessWidget {
  EntryCard({super.key, required this.entry, required this.isSaved});

  final bool isSaved;
  final Entry entry;
  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        background: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
          child: Container(
              color: Colors.red,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 100),
                    child: Center(child: Icon(Icons.delete)),
                  ),
                ],
              )),
        ),
        key: ValueKey<int>(entry.id),
        direction:
            isSaved ? DismissDirection.endToStart : DismissDirection.none,
        onDismissed: (direction) {
          daoController.deleteEntry(entry: entry);
        },
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Details(entry: entry)));
              },
              child: Ink(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          fit: BoxFit.fill,
                          entry.image,
                          width: 112,
                          height: 180,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: SizedBox(
                              width: 200,
                              child: Text(
                                entry.name.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'Philosopher', fontSize: 21),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SizedBox(
                              width: 200,
                              child: Text(
                                entry.description,
                                textAlign: TextAlign.justify,
                                style: TextStyle(),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                child: Container(
                  height: 88,
                  width: double.infinity,
                  color: ThemeColors.chips_container_color,
                  child: Wrap(
                    children: entry
                        .commomLocationsConverter()
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Chip(
                                  label: Text(
                                    e,
                                    style: TextStyle(fontFamily: 'Roboto'),
                                  ),
                                  backgroundColor:
                                      ThemeColors.chips_container_color),
                            ))
                        .toList(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
