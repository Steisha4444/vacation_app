import 'package:flutter/material.dart';
import 'package:vacation_app/models/vacationType.dart';
import 'package:vacation_app/widgets/input.dart';

class FormRequest extends StatefulWidget {
  const FormRequest({Key? key}) : super(key: key);

  @override
  State<FormRequest> createState() => _FormRequestState();
}

class _FormRequestState extends State<FormRequest> {
  DateTimeRange? _selectedDateRange;

  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if (result != null) {
      // Rebuild the UI
      print(result.start.toString());
      setState(() {
        _selectedDateRange = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    VacationType? myVacation = VacationType.vacation;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text('Тип відпустки'),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      color: const Color.fromARGB(255, 72, 22, 148))),
              child: DropdownButtonFormField<VacationType>(
                value: myVacation,
                onChanged: (VacationType? newValue) {
                  myVacation = newValue;
                },
                items: VacationType.values.map((VacationType vacationType) {
                  return DropdownMenuItem<VacationType>(
                      value: vacationType,
                      child: Text(
                        vacationType.displayTitle,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black),
                      ));
                }).toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Бажана дата'),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      color: const Color.fromARGB(255, 72, 22, 148))),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: _show,
                    child: (_selectedDateRange?.start != null &&
                            _selectedDateRange?.end != null)
                        ? Text(
                            '${_selectedDateRange?.start.toString().split(' ')[0]} - ${_selectedDateRange?.end.toString().split(' ')[0]}',
                            style: const TextStyle(color: Colors.black),
                          )
                        : const Text(
                            'Оберіть дату',
                            style: TextStyle(color: Colors.black),
                          )

                    // Text(
                    //   '${_selectedDateRange?.start.toString().split(' ')[0]} - ${_selectedDateRange?.end.toString().split(' ')[0]}',
                    // ),
                    ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Підтвердження від'),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: const Color.fromARGB(255, 72, 22, 148))),
                child: DropdownButtonFormField<VacationType>(
                  value: myVacation,
                  onChanged: (VacationType? newValue) {
                    myVacation = newValue;
                  },
                  items: VacationType.values.map((VacationType vacationType) {
                    return DropdownMenuItem<VacationType>(
                        value: vacationType,
                        child: Text(
                          vacationType.displayTitle,
                          textAlign: TextAlign.left,
                          style: const TextStyle(color: Colors.black),
                        ));
                  }).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Коментар',
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      color: const Color.fromARGB(255, 72, 22, 148))),
              child: TextFormField(
                minLines: 1,
                maxLines: 3,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 150,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Подати запит',
                style:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 58, 23, 129))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
