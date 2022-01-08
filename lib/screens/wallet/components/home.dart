import 'package:assist_queen/constant/note_theme.dart';
import 'package:assist_queen/screens/wallet/components/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class WalHomePage extends StatefulWidget {
  const WalHomePage({Key? key}) : super(key: key);

  @override
  _WalHomePageState createState() => _WalHomePageState();
}

class _WalHomePageState extends State<WalHomePage> {
  String _selectedTime = '9:21 AM';
  TextEditingController mycontro = TextEditingController();
  TextEditingController date_controller = new TextEditingController();
  bool showProgress = false;
  String date_of_birth = "";
  int year = 0;
  int day = 0;
  int month = 0;
  @override
  Widget build(BuildContext context) {
    //time picker
    Future<void> _openTimePicker(BuildContext context) async {
      final TimeOfDay? t =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());

      if (t != null) {
        setState(() {
          _selectedTime = t.format(context);
        });
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/images/bg_img.png'))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: InkWell(
                child: IconButton(
                    onPressed: () {
                      print('Hello daddy');
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: NoteTheme.mainTextColor,
                    )),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.white, // Button color
                      child: InkWell(
                        splashColor: Colors.deepPurpleAccent,
                        // Splash color
                        onTap: () {
                          print('pressed on income/exp');
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              builder: (context) {
                                return TabWidget();
                              });
                        },
                        child: const SizedBox(
                            width: 56,
                            height: 56,
                            child: Icon(
                              Icons.car_rental_outlined,
                              color: Colors.blueAccent,
                            )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                SizedBox(
                  width: 180,
                  // height: 90,
                  // padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Enter Amount",
                        ),
                        keyboardType: TextInputType.number,

                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 630,
                  decoration: BoxDecoration(
                      color: NoteTheme.mainBgColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Container(
                    width: 350,
                    // height: 230,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 6,
                              blurRadius: 7,
                              offset: const Offset(0, 3))
                        ]),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            var parts = date_of_birth.split('/');
                            if (parts.length >= 2) {
                              year = int.parse(parts[2].trim());
                              month = int.parse(parts[1].trim());
                              day = int.parse(parts[0].trim());
                            }

                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    actions: <Widget>[
                                      Container(
                                        height: 30,
                                        child: MaterialButton(
                                          color: Colors.green,
                                          child: const Text(
                                            'Set',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              date_of_birth =
                                                  date_controller.text;
                                            });

                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                      TextButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          setState(() {
                                            date_controller.text =
                                                date_of_birth;
                                          });

                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                    content: SizedBox(
                                      height: 300,
                                      width: 300,
                                      child: SfDateRangePicker(
                                        initialSelectedDate:
                                            DateTime(year, month, day),
                                        onSelectionChanged: _onSelectionChanged,
                                        selectionMode:
                                            DateRangePickerSelectionMode.single,
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: date_controller,
                            enableInteractiveSelection: false,
                            enabled: false,
                            focusNode: FocusNode(),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.calendar_today,
                                color: Colors.black,
                              ),
                              label: Center(
                                  child: Text(
                                'Today Date',
                                style: TextStyle(color: Colors.black),
                              )),
                            ),
                          ),
                        ),
                        // const Divider(
                        //   thickness: 2,
                        //   indent: 5,
                        //   endIndent: 5,
                        //   color: Colors.grey,
                        // ),
                        TextButton(
                            onPressed: () {
                              _openTimePicker(context);
                            },
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: mycontro,
                              enableInteractiveSelection: false,
                              enabled: false,
                              focusNode: FocusNode(),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock_clock,
                                  color: Colors.black,
                                ),
                                label: Center(
                                  child: Text(
                                    _selectedTime,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                // hintText: _selectedTime,
                              ),
                            )),
                        // const Divider(
                        //   thickness: 2,
                        //   indent: 5,
                        //   endIndent: 5,
                        //   color: Colors.grey,
                        // ),
                        const TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          obscureText: false,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              // labelText: "Write Note",
                              label: Text(
                                "Write Note",
                                style: TextStyle(color: Colors.black),
                              ),
                              prefixIcon: Icon(
                                Icons.note_add,
                                color: Colors.black,
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
      } else if (args.value is DateTime) {
        date_controller.text =
            DateFormat('dd/MM/yyyy').format(args.value).toString();
        ;
      } else if (args.value is List<DateTime>) {
      } else {}
    });
  }
}
