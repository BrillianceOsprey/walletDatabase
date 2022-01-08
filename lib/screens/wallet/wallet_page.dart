import 'package:assist_queen/components/edit_note_page.dart';
import 'package:assist_queen/components/note_card_widget.dart';
import 'package:assist_queen/components/wallet_item.dart';
import 'package:assist_queen/constant/note_theme.dart';
import 'package:assist_queen/database_helper/database.dart';
import 'package:assist_queen/model_class/note.dart';
import 'package:assist_queen/screens/details/details.dart';
import 'package:assist_queen/screens/wallet/components/home.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  late List<Note>? notes = [];
  bool isLoading = false;
  int axisCount = 2;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    var fullWidth = MediaQuery.of(context).size.width;
    var fullHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Wallet',
                  style: TextStyle(
                      fontFamily: 'RobotoMono',
                      color: NoteTheme.mainTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 100,
                ),
                InkWell(
                    onTap: () {
                      print('Clicked Chart');
                    },
                    child: Icon(
                      Icons.pie_chart_rounded,
                      color: NoteTheme.mainIconColor,
                    ))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/rich.png',
                    width: 30,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'Income',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.mainTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          '1200000',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.greenAccentColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Image.asset(
                    'assets/images/expenses.png',
                    width: 30,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'Expense',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.mainTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          '1000000',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.redAccentColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Image.asset(
                    'assets/images/dollar.png',
                    width: 30,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'Net Income',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.mainTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          '200000',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.mainTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  height: fullHeight / 1.45,
                  // height: double.infinity,

                  decoration: BoxDecoration(
                      color: NoteTheme.mainBgColor,
                      // color: Colors.deepPurple,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: SafeArea(
                      child: Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: ListView.builder(
                        itemCount: notes!.length,
                        itemBuilder: (context, index) {
                          final note = notes![index];

                          return GestureDetector(
                            onTap: () async {
                              await Navigator.of(context)
                                  .push(MaterialPageRoute(
                                builder: (context) =>
                                    NoteDetailPage(noteId: note.id!),
                              ));

                              refreshNotes();
                            },
                            child: WalletItem(note: note, index: index),
                          );
                        }),
                  )),
                ),
              ),
              Center(
                child: InkWell(
                  child: IconButton(
                      onPressed: () {
                        print('Click on add button');
                        Navigator.of(context).push(MaterialPageRoute(
                            // builder: (context) => const AddEditNotePage()));
                            builder: (context) => const WalHomePage()));
                      },
                      icon: const Icon(Icons.add)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
