import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vacation_app/controllers/request_controller.dart';
import 'package:vacation_app/models/user.dart';
import 'package:vacation_app/models/vacationType.dart';
import 'package:vacation_app/widgets/label.dart';

class RequestForm extends GetView<RequestController> {
  String _formatDate(DateTime? date) {
    return '${date?.day}/${date?.month}/${date?.year}';
  }

  final controller = Get.put(RequestController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(
      builder: (_) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Label('Тип відпустки'),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Color.fromARGB(255, 82, 79, 79),
                ),
              ),
              child: DropdownButtonFormField<VacationType>(
                value: controller.vacationType,
                onChanged: controller.onSelectVacationType,
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
            const SizedBox(
              height: 20,
            ),
            const Label('Бажана дата'),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Color.fromARGB(255, 0, 0, 0))),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: () => controller.show(context),
                      child: (controller.dateRange?.start != null &&
                              controller.dateRange?.end != null)
                          ? Text(
                              '${_formatDate(controller.dateRange?.start)} - ${_formatDate(controller.dateRange?.end)}',
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
            const Label('Підтвердження від'),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              child: DropdownButtonFormField<User>(
                value: controller.selectedUser,
                onChanged: controller.onSelectUser,
                items: controller.users.map((User user) {
                  return DropdownMenuItem<User>(
                      value: user,
                      child: Text(
                        user.fullName,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black),
                      ));
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Label('Коментар'),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Color.fromARGB(255, 0, 0, 0))),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                  ),
                  controller: controller.commentController,
                  minLines: 1,
                  maxLines: 3,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: 150,
                child: TextButton(
                  onPressed: controller.isValid ? controller.onSubmit : null,
                  child: Text(
                    'Подати запит',
                    style: const TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      controller.isValid
                          ? Color.fromARGB(255, 58, 23, 129)
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
