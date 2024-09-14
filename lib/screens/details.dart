import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.entry});

  final Entry entry;
  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.bookmark) , onPressed: () {
        daoController.saveEntry(entry: entry);
      } ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(entry.name.toUpperCase(),
                style: TextStyle(fontFamily: 'Philosopher', fontSize: 21)),
            Wrap(
                children: entry
                    .commomLocationsConverter()
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: Chip(label: Text(e)),
                        ))
                    .toList()),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                width: double.infinity,
                height: 220,
                fit: BoxFit.fill,
                entry.image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(entry.description),
            )
          ],
        ),
      ),
    ));
  }
}
