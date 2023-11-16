import 'dart:convert';
import 'package:findobj/ui/model/itemlist_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

import '../../../config/constant.dart';
import '../../../config/global_style.dart';
import '../home/tab_home.dart';
import 'AppPage01.dart';
import 'appPage02Detail.dart';


class AppPage02 extends StatefulWidget {
  @override
  _AppPage02State createState() => _AppPage02State();
}

class _AppPage02State extends State<AppPage02> {

  TextEditingController _etSearch2 = TextEditingController();
  List<itemlist_model> itemDataList = itemData;
  String _subsubsub = "";

  List<DataRow> _dataGrid(itemlist_model itemData){
    return [
      DataRow(
        cells: <DataCell>[
          DataCell(
            ConstrainedBox(constraints: BoxConstraints(maxWidth: 75),
                child: Text('${itemData.seq}',
                    overflow: TextOverflow.ellipsis)),
          ),
          DataCell(
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ConstrainedBox(constraints: BoxConstraints(maxWidth: 55, minWidth: 50),
                    child: Text('${itemData.itemsubject}',
                        overflow: TextOverflow.ellipsis)),
              ],
            ),
          ),
          DataCell(
              Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        this._subsubsub = '${itemData.itemsubject}';
                      });

                      //Navigator.push(context, MaterialPageRoute(builder: (context) => AppPage02Detail(itemData: itemData)));

                    },
                    child: ConstrainedBox(
                      constraints:  BoxConstraints(minWidth: 180 , maxWidth: 180),
                      child: Text('${itemData.itemsubject}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: SOFT_BLUE, fontSize: 12, fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  ),
                ],
              )
          ),
          DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 50), //SET max width
                      child: Text('${itemData.pernm}',
                          overflow: TextOverflow.ellipsis)),
                ],
              )
          ),
          DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // margin: EdgeInsets.only(right: 5),
                  ),
                  Text('${itemData.inputdate}')
                ],
              )
          ),

        ],
      ),
    ];
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      itemlist_getdata();
    });

  }

  @override
  void dispose() {
    super.dispose();
  }

  //---------cording ---------
  Future itemlist_getdata() async {

      return ;

  }



  @override
  Widget build(BuildContext context){
    int _selectedIndex = 0;  //bottom index
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: GlobalStyle.appBarIconThemeColor,
        ),
        elevation: GlobalStyle.appBarElevation,
        title: Text(
          '분실/습득리스트',
          style: GlobalStyle.appBarTitle,
        ),
        actions: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextButton(onPressed: (){
                  setState(() {
                    itemlist_getdata();
                  });
                }, child: Text('검색하기')),
              ),
            ],
          )
        ],
        backgroundColor: GlobalStyle.appBarBackgroundColor,
        systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextFormField(
            controller: _etSearch2,
            textAlignVertical: TextAlignVertical.bottom,
            maxLines: 1,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),

            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              filled: true,
              hintText: '게시글 제목검색',
              prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
              suffixIcon: (_etSearch2.text == '')
                  ? null
                  : GestureDetector(
                  onTap: () {
                    setState(() {
                      _etSearch2 = TextEditingController(text: '');
                    });
                  },
                  child: Icon(Icons.close, color: Colors.grey[500])),
              focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.grey[200]!)),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
            ),
          ),
          Container(
            padding:EdgeInsets.only(top:16, bottom: 2, left: 10),
            child: Text('분실습득건수 ${itemData.length} 건',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500, color: CHARCOAL
                )),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(top: 15),
              height: 0.638 * MediaQuery.of(context).size.height,
              width: 600,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  DataTable(
                      showCheckboxColumn: false,
                      columnSpacing: 25, dataRowHeight: 40,
                      headingTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      headingRowColor:
                      MaterialStateColor.resolveWith((states) => SOFT_BLUE),

                      columns: <DataColumn>[
                        DataColumn(label: Text('No.')),
                        DataColumn(label: Text('분류')),
                        DataColumn(label: Text('위치')),
                        DataColumn(label: Text('제목')),
                        DataColumn(label: Text('작성자')),
                        DataColumn(label: Text('작성일자')),
                      ],
                      rows: List<DataRow>.generate(itemData.length,(index)
                      {
                        final itemlist_model item = itemData[index];
                        return
                          DataRow(
                              onSelectChanged: (value){
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => AppPage02Deatil(itemData: item)));
                              },
                              color: MaterialStateColor.resolveWith((states){
                                if (index % 2 == 0){
                                  return Color(0xB8E5E5E5);
                                }else{
                                  return Color(0x86FFFFFF);
                                }
                              }),
                              cells: [
                                DataCell(
                                    Container(
                                        child: Text('${index+1}',
                                        ))),
                                DataCell(
                                    Container(
                                        child: Text(item.flagnm
                                        ))),
                                DataCell(Container(
                                  child: Text(item.location,
                                      overflow: TextOverflow.ellipsis),
                                )),
                                DataCell(Container(
                                  child: Text(item.itemsubject,
                                      overflow: TextOverflow.ellipsis),
                                )),
                                DataCell(Text(item.pernm,
                                    overflow: TextOverflow.ellipsis)),
                                DataCell(
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text('${item.inputdate}',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: SOFT_BLUE,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold
                                              )
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ]

                          );
                      }
                      )
                  ),],
              ),
            ),
          ),


        ],
      ),

      bottomNavigationBar:  BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) { // 1번째 아이템을 눌렀을 때
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => TabHomePage()));          }
          if (index == 1) { // 2번째 아이템을 눌렀을 때
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => AppPage01()));          }
          if (index == 2) { // 3번째 아이템을 눌렀을 때
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => AppPage02()));            }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '분실물등록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '분실물조회',
          ),
        ],
      ),



    );
  }

}