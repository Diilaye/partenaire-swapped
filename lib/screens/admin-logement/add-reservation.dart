import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-logement-bloc.dart';
import 'package:partenaire/bloc/reservation-bloc.dart';
import 'package:partenaire/bloc/update-logement-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/price-format.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class AddReservationScreen extends StatelessWidget {
  const AddReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final reservationBloc = Provider.of<ReservationBloc>(context);
    final adminLogementBloc = Provider.of<AdminPartenaireBloc>(context);
    final updateLogementBloc = Provider.of<UpdateLogementBloc>(context);

    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: TableCalendar(
            headerStyle: const HeaderStyle(
              leftChevronVisible: true,
              rightChevronVisible: true,
              headerPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              formatButtonVisible: false,
            ),
            locale: 'fr_FR',
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerVisible: true,
            firstDay: DateTime.utc(2023, 01, 01),
            rangeEndDay: reservationBloc.rangeEnd,
            rangeStartDay: reservationBloc.rangeStart,
            onDaySelected: (selectedDay, focusedDay) =>
                reservationBloc.onDaySelected(selectedDay),
            onRangeSelected: (start, end, focusedDay) =>
                reservationBloc.selectedRangeDate(
              start,
              end,
            ),
            // rowHeight: 100,
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            shouldFillViewport: true,
            lastDay: DateTime.utc(2030, 31, 31),
            focusedDay: reservationBloc.focusDay!,
          ),
        ),
        SizedBox(height: size.height * .02),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              SizedBox(
                width: size.width * .01,
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: blanc,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 1,
                              color: noir.withOpacity(.2))
                        ]),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            const Text('Ajouter réservations'),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    readOnly: true,
                                    controller: reservationBloc.dateDebut,
                                    decoration: InputDecoration(
                                        labelText: reservationBloc
                                                .dateDebut.text.isEmpty
                                            ? 'Date début'
                                            : '',
                                        border: const UnderlineInputBorder()),
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              locale: const Locale("fr", "FR"),
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2023),
                                              lastDate: DateTime(2030))
                                          .then((value) => reservationBloc
                                              .setDateDebut(value));
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    readOnly: true,
                                    controller: reservationBloc.dateFin,
                                    decoration: InputDecoration(
                                        labelText:
                                            reservationBloc.dateFin.text.isEmpty
                                                ? 'Date fin'
                                                : '',
                                        border: const UnderlineInputBorder()),
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              locale: const Locale("fr", "FR"),
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2023),
                                              lastDate: DateTime(2030))
                                          .then((value) => reservationBloc
                                              .setDateFin(value));
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Nom complet de l\'invité'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Téléphone de l\'invité'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                GestureDetector(
                                  onTap: () async {
                                    await reservationBloc.addReservation(
                                        updateLogementBloc.bien!.id!);

                                    if (reservationBloc.addReserve != null) {
                                      adminLogementBloc.setMenu(3);
                                      reservationBloc.menuReservation = 0;
                                      reservationBloc.getAllReservation();
                                      Navigator.popAndPushNamed(context, "/");
                                    }
                                  },
                                  child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: noir),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Center(
                                          child: reservationBloc.chargementAdd
                                              ? CircularProgressIndicator(
                                                  color: blanc,
                                                  backgroundColor: noir,
                                                )
                                              : Text(
                                                  'Enregister',
                                                  style:
                                                      TextStyle(color: blanc),
                                                ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                          ],
                        )),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                width: size.width * .01,
              ),
            ],
          ),
        ),
        SizedBox(height: size.height * .02),
      ],
    );
  }
}
