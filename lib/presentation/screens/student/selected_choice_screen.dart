import 'package:flutter/material.dart';

class SelectedChoiceScreen extends StatelessWidget {
  final String selectedChoice;

  const SelectedChoiceScreen({Key? key, required this.selectedChoice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                rows:  [
                  DataRow(cells: [
                    DataCell(IconButton(onPressed: (){}, icon: const Icon(Icons.add))),
                    const DataCell(Icon(Icons.close, color: Colors.red)),
                    const DataCell(Text('3')),
                    const DataCell(Text('مادة 1')),
                    const DataCell(Text('HE51')),
                  ]),
                  DataRow(cells: [
                    DataCell(IconButton(onPressed: (){}, icon: const Icon(Icons.add))),
                    const DataCell(Icon(Icons.check, color: Colors.green)),
                    const DataCell(Text('2')),
                    const DataCell(Text('مادة 2')),
                    const DataCell(Text('HE63')),
                  ]),
                  DataRow(cells: [
                    DataCell(IconButton(onPressed: (){}, icon: const Icon(Icons.add))),
                    const DataCell(Icon(Icons.close, color: Colors.red)),
                    const DataCell(Text('4')),
                    const DataCell(Text('مادة 3')),
                    const DataCell(Text('HE02')),
                  ]),
                  DataRow(cells: [
                    DataCell(IconButton(onPressed: (){}, icon: const Icon(Icons.add))),
                    const DataCell(Icon(Icons.close, color: Colors.red)),
                    const DataCell(Text('4')),
                    const DataCell(Text('مادة 4')),
                    const DataCell(Text('HE53')),
                  ]),
                  DataRow(cells: [
                    DataCell(IconButton(onPressed: (){}, icon: const Icon(Icons.add))),
                    const DataCell(Icon(Icons.close, color: Colors.red)),
                    const DataCell(Text('5')),
                    const DataCell(Text('مادة 5')),
                    const DataCell(Text('HE17')),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
