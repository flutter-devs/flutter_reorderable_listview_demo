import 'package:flutter/material.dart';

class ReorderableViewPage extends StatefulWidget {
  List<String> item = ["Clients","Designer","Developer","Director",
    "Employee", "Manager", "Worker","Owner"];
  @override
  _ReorderableViewPageState createState() => _ReorderableViewPageState();
}

class _ReorderableViewPageState extends State<ReorderableViewPage> {

  void reorderData(int oldindex, int newindex){
    setState(() {
      if(newindex>oldindex){
        newindex-=1;
      }
      final items =widget.item.removeAt(oldindex);
      widget.item.insert(newindex, items);
    });
  }

  void sorting(){
    setState(() {
      widget.item.sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Reorderable ListView In Flutter",
          style: TextStyle(color: Colors.pinkAccent[100]),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.sort_by_alpha),
              tooltip:"Sort",
              onPressed: sorting
          ),
        ],
      ),
      body: ReorderableListView(
        children: <Widget>[
          for(final items in widget.item)
            Card(
              color: Colors.blueGrey,
              key: ValueKey(items),
              elevation: 2,
              child: ListTile(
                title: Text(items),
                leading: Icon(Icons.work,color: Colors.black,),
              ),
            ),
        ],
        onReorder: reorderData,

      ),
    );
  }
}

