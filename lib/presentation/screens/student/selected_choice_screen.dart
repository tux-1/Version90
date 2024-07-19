import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SelectedChoiceScreen extends StatelessWidget {
  final String selectedChoice;

  SelectedChoiceScreen({Key? key, required this.selectedChoice})
      : super(key: key);

  final Map<int, Map<String, String>> subjects = {
    0: {
      'HU1001': 'Maths 1',
    },
    1: {
      'HU2001': 'Probability',
      'HU2002': 'Analog Electronics 1',
    },
    2: {
      'HU3001': 'Communication Technology',
      'HU3002': 'Signals',
      'HU3003': 'Electronic Measurement',
    },
    3: {
      'HU4001': 'Digital Communication',
      'HU4002': 'DSP',
      'HU4003': 'Software Engineering',
    },
    4: {
      'HU5001': 'Machine Learning',
      'HU5002': 'Computer Vision',
      'HU5003': 'Embedded Systems',
    },
  };

  @override
  Widget build(BuildContext context) {
    // Extract the last character from the selectedChoice string
    int level = int.tryParse(selectedChoice.split(' ').last) ?? 0;
    // Get the subjects for the selected level
    Map<String, String> levelSubjects = subjects[level] ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Choice: $selectedChoice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'التسجيل الأكاديمي - المستوى: $selectedChoice',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Wrap the DataTable with SingleChildScrollView
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('تسجيل')),
                  DataColumn(label: Text('حالة الدراسة')),
                  DataColumn(label: Text('الساعات')),
                  DataColumn(label: Text('المادة')),
                  DataColumn(label: Text('الكود')),
                ],
                rows: levelSubjects.entries.map((entry) {
                  return DataRow(cells: [
                    DataCell(
                      IconButton(
                        onPressed: () async {
                          final userId = FirebaseAuth.instance.currentUser?.uid;
                          if (userId != null) {
                            final studentDoc = await FirebaseFirestore.instance
                                .collection('students')
                                .doc(userId)
                                .get();

                            final currentSubjects =
                                studentDoc.data()?['subjects'] ?? {};

                            if (currentSubjects.length >= 2) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'You can only register up to 2 subjects.'),
                                ),
                              );
                              return;
                            }

                            try {
                              await FirebaseFirestore.instance
                                  .collection('students')
                                  .doc(userId)
                                  .set({
                                'subjects': {entry.key: entry.value}
                              }, SetOptions(merge: true));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('${entry.value} added')),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Failed to add subject')),
                              );
                            }
                          }
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ),
                    const DataCell(Icon(Icons.check, color: Colors.green)),
                    const DataCell(
                      Text('3'),
                    ), // Assuming each subject is 3 hours
                    DataCell(Text(entry.value)),
                    DataCell(Text(entry.key)),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
