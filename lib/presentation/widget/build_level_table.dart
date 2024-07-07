import 'package:flutter/material.dart';

Widget buildLevelTable(String level, List<List<String>> subjects) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.brown[700],
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.brown[800],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
          ),
          child: Text(
            level,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
        Table(
          border: TableBorder.all(color: Colors.black),
          children: [
            const TableRow(
              decoration: BoxDecoration(color: Colors.grey),
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Subjects',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Grade',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Grading',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
              ],
            ),
            for (var subject in subjects)
              TableRow(
                decoration: BoxDecoration(color: Colors.brown[200]),
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(subject[0],
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(subject[1],
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(subject[2],
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    ),
  );
}
