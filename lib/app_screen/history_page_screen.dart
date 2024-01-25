import 'package:flutter/material.dart';

class HistoryPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
      ),
      body: HistoryList(),
    );
  }
}

class HistoryList extends StatefulWidget {
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  List<HistoryItem> historyItems = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: historyItems.map((historyItem) => historyItem.weekTitleContainer).toList(),
    );
  }

  void addHistoryItem(String title, String description) {
    setState(() {
      DateTime now = DateTime.now();
      String date = "${now.day}-${now.month}";
      historyItems.insert(0, HistoryItem(date, [HistoryItemWidget(title, description)]));

      // Ensure only the latest 30 items are kept
      if (historyItems.length > 30) {
        historyItems.removeLast();
      }
    });
  }
}

class HistoryItem {
  final String weekTitle;
  final List<HistoryItemWidget> historyItems;

  HistoryItem(this.weekTitle, this.historyItems);

  Widget get weekTitleContainer => Text(weekTitle); // Corrected getter
}

class HistoryItemWidget extends StatelessWidget {
  final String title;
  final String description;

  HistoryItemWidget(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(description),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              // Add your 'more' button functionality here
            },
            child: Text('More'),
          ),
        ],
      ),
    );
  }
}
