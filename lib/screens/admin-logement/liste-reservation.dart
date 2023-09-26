import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/reservation-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/price-format.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class ListeReservation extends StatelessWidget {
  const ListeReservation({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final reservationBloc = Provider.of<ReservationBloc>(context);

    return reservationBloc.menuReservation == 0
        ? Column(
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
                              const Text('Dernières réservations'),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(child: Text("N°")),
                                      Expanded(flex: 2, child: Text("Nom")),
                                      Expanded(child: Text("Montant")),
                                      Expanded(child: Text("Date debut")),
                                      Expanded(child: Text("Date fin")),
                                      Expanded(child: Text("Statut")),
                                      Expanded(flex: 2, child: Text("Action")),
                                      SizedBox(
                                        width: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Column(
                                    children: reservationBloc.reservations
                                        .map((e) => Container(
                                              color: e.status ==
                                                      'accept-partenaire'
                                                  ? vert.withOpacity(.2)
                                                  : e.status ==
                                                          'create-partenaire'
                                                      ? meuveClair
                                                      : blanc,
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 16,
                                                      ),
                                                      Expanded(
                                                          child: Text(
                                                              "#${e.id!.substring(0, 6)}",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color:
                                                                      noir))),
                                                      Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                              e.bien!.titre!,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color:
                                                                      noir))),
                                                      Expanded(
                                                          child: Text(
                                                              getFormatPrice(e
                                                                      .bien!
                                                                      .tarif! *
                                                                  DateTime.parse(e
                                                                          .dateFin!)
                                                                      .difference(
                                                                          DateTime.parse(e
                                                                              .dateDebut!))
                                                                      .inDays),
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color:
                                                                      noir))),
                                                      Expanded(
                                                          child: Text(
                                                              e.dateDebut!
                                                                  .split(" ")
                                                                  .first
                                                                  .split("-")
                                                                  .reversed
                                                                  .join("-"),
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color:
                                                                      noir))),
                                                      Expanded(
                                                          child: Text(
                                                              e.dateFin!
                                                                  .split(" ")
                                                                  .first
                                                                  .split("-")
                                                                  .reversed
                                                                  .join("-"),
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color:
                                                                      noir))),
                                                      Expanded(
                                                          child: Center(
                                                        child: Row(
                                                          children: [
                                                            const SizedBox(
                                                              width: 12,
                                                            ),
                                                            Container(
                                                              width: 15,
                                                              height: 15,
                                                              decoration: BoxDecoration(
                                                                  color: e.status! ==
                                                                          "create"
                                                                      ? orange
                                                                      : vertFonce,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  border: Border.all(
                                                                      color: e.status! ==
                                                                              "create"
                                                                          ? orange
                                                                          : vertFonce)),
                                                            ),
                                                            const SizedBox(
                                                              width: 6,
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                      Expanded(
                                                          flex: 2,
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                  child: Center(
                                                                child:
                                                                    IconButton(
                                                                  onPressed: () => reservationBloc.selectedRangeDate(
                                                                      DateTime.parse(e
                                                                          .dateDebut!),
                                                                      DateTime.parse(
                                                                          e.dateFin!)),
                                                                  icon: Icon(
                                                                    CupertinoIcons
                                                                        .calendar,
                                                                    color: noir,
                                                                  ),
                                                                ),
                                                              )),
                                                              const SizedBox(
                                                                width: 8,
                                                              ),
                                                              Expanded(
                                                                  child: Center(
                                                                child:
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          if (e.prospect ==
                                                                              null) {
                                                                            reservationBloc.setSelectedReservation(e);
                                                                          }
                                                                        },
                                                                        icon:
                                                                            Icon(
                                                                          CupertinoIcons
                                                                              .eye_fill,
                                                                          color:
                                                                              jaune,
                                                                        )),
                                                              )),
                                                              const SizedBox(
                                                                width: 8,
                                                              ),
                                                              Expanded(
                                                                  child: Center(
                                                                child: Icon(
                                                                  CupertinoIcons
                                                                      .checkmark,
                                                                  color: vert,
                                                                ),
                                                              )),
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                              Expanded(
                                                                  child: Center(
                                                                child: Icon(
                                                                  CupertinoIcons
                                                                      .delete,
                                                                  color: rouge,
                                                                ),
                                                              )),
                                                            ],
                                                          )),
                                                      SizedBox(
                                                        width: 16,
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  )
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  )
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
          )
        : reservationBloc.menuReservation == 1
            ? Column(
                children: [
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .01,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: blanc,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 0),
                                        blurRadius: 2,
                                        color: noir.withOpacity(.2))
                                  ]),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * .02,
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                          height: 200,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: blanc,
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: const Offset(0, 0),
                                                    blurRadius: 2,
                                                    color: noir.withOpacity(.2))
                                              ]),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              reservationBloc
                                                  .selectedReservation!
                                                  .bien!
                                                  .galery!
                                                  .first
                                                  .url!,
                                              height: 300,
                                              width: 200,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 200,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                SizedBox(
                                                  height: 35,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        reservationBloc
                                                            .selectedReservation!
                                                            .bien!
                                                            .titre!,
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                SizedBox(
                                                  height: 35,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Adresse : ${reservationBloc.selectedReservation!.bien!.adresse!} ",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                SizedBox(
                                                  height: 35,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        " Date debut : ${reservationBloc.selectedReservation!.dateDebut!.split(" ")[0].split("-").reversed.join("-")} Date fin : ${reservationBloc.selectedReservation!.dateFin!.split(" ")[0].split("-").reversed.join("-")} ",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      " Montant total : ${getFormatPrice(DateTime.parse(reservationBloc.selectedReservation!.dateFin!).difference(DateTime.parse(reservationBloc.selectedReservation!.dateDebut!)).inDays * reservationBloc.selectedReservation!.bien!.tarif!)} FGN ",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    const Spacer(),
                                                    if (reservationBloc
                                                            .selectedReservation!
                                                            .status ==
                                                        "create")
                                                      GestureDetector(
                                                        onTap: () => dialogRequest(
                                                                context:
                                                                    context,
                                                                title:
                                                                    "vous êtes ur de vouloir accepter cette réservartion")
                                                            .then((value) {
                                                          if (value) {
                                                            reservationBloc
                                                                .updateStatusReservation(
                                                                    reservationBloc
                                                                        .selectedReservation!
                                                                        .id!);
                                                          }
                                                        }),
                                                        child: Container(
                                                            height: 35,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: vert,
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 16,
                                                                ),
                                                                Text(
                                                                  " Valider ",
                                                                  style: TextStyle(
                                                                      color:
                                                                          blanc),
                                                                ),
                                                                const SizedBox(
                                                                  width: 16,
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    SizedBox(
                                                      width: 16,
                                                    ),
                                                    Container(
                                                        height: 35,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: rouge,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            const SizedBox(
                                                              width: 16,
                                                            ),
                                                            Text(
                                                              " Annuler ",
                                                              style: TextStyle(
                                                                  color: blanc),
                                                            ),
                                                            const SizedBox(
                                                              width: 16,
                                                            ),
                                                          ],
                                                        )),
                                                    SizedBox(
                                                      width: 16,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () => reservationBloc
                                                          .setMenuReservation(
                                                              0),
                                                      child: Container(
                                                          height: 35,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            color: noir,
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              const SizedBox(
                                                                width: 16,
                                                              ),
                                                              Text(
                                                                " Retour ",
                                                                style: TextStyle(
                                                                    color:
                                                                        blanc),
                                                              ),
                                                              const SizedBox(
                                                                width: 16,
                                                              ),
                                                            ],
                                                          )),
                                                    ),
                                                    const SizedBox(
                                                      width: 16,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                                  SizedBox(
                                    height: size.height * .02,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * .01,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .01,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: blanc,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 0),
                                        blurRadius: 2,
                                        color: noir.withOpacity(.2))
                                  ]),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            child: Image.asset(
                                              "assets/images/avatar.jpg",
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "${reservationBloc.selectedReservation!.client!.prenom!} ${reservationBloc.selectedReservation!.client!.nom!}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 2,
                                    color: gris,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    color: gris.withOpacity(.3),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 8,
                                        ),
                                        const Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                    "Pour parler aux hôtes, utilisez SwapeD afin de leur envoyer un message rapide et montrer que vous êtes intéressé par leur logement.Pour rester en sécurité et garder vos informations privées, nous échangeons les numéros de téléphone après avoir confirmé la réservation. "),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    color: gris.withOpacity(.4),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Center(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    child: Image.asset(
                                                      "assets/images/deally.png",
                                                      width: 30,
                                                      height: 30,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const Spacer()
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Expanded(
                                      child: ListView(
                                    children: reservationBloc
                                        .selectedReservation!.messages!
                                        .map((e) => Column(
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment: e
                                                              .statusSender ==
                                                          "client"
                                                      ? MainAxisAlignment.end
                                                      : MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(e.text!),
                                                    SizedBox(
                                                      width: 10,
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                )
                                              ],
                                            ))
                                        .toList(),
                                  )),
                                  Container(
                                    color: gris.withOpacity(.2),
                                    height: size.height * .06,
                                    child: TextField(
                                      controller: reservationBloc.textMessage,
                                      decoration: InputDecoration(
                                          labelText: 'Entrez votre message',
                                          suffixIcon: IconButton(
                                              onPressed: () =>
                                                  reservationBloc.addMessage(),
                                              icon: Icon(
                                                Icons.send,
                                                color: noir,
                                              ))),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * .01,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: size.height * .01,
                  ),
                ],
              )
            : Column();
  }
}
