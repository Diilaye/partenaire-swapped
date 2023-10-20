import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/faq-bloc.dart';
import 'package:partenaire/bloc/partenaire-bloc.dart';
import 'package:partenaire/screens/about-us-screen.dart';
import 'package:partenaire/screens/add-partenaire-screen.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:provider/provider.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final partenaireBloc = Provider.of<PartenairesBloc>(context);
    final faqBloc = Provider.of<FaqBloc>(context);

    return Scaffold(
      backgroundColor: blanc,
      appBar: AppBar(
        elevation: .0,
        toolbarHeight: .0,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: ListView(
              children: [
                SizedBox(
                  height: size.height * .1,
                ),
                const Text(
                  'Questions fréquemment posées',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(1),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "Comment devenir partenaire SwapeD ?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 1)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                    'Pour devenir partenaire SwapeD, veuillez visiter le lien swaped.deally.fr et remplir les informations requises. Une fois que vous avez complété le formulaire, notre équipe de support prendra contact avec vous pour valider votre profil. Après cette validation, nous vous fournirons vos identifiants et votre mot de passe personnels pour accéder à votre compte. '),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(2),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "Comment créer un compte utilisateur sur SwapeD  ?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 2)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                    'Pour créer un compte utilisateur, téléchargez l\'application SwapeD depuis le Google PlayStore. Remplissez vos informations personnelles et vos informations de paiement pour pouvoir bénéficier instantanément de tous les services offerts par SwapeD. '),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(3),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "Comment sont calculés les tarifs des commandes   ?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 3)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text("""
Les tarifs des commandes varient selon le service demandé. Les courses en moto ou VTC sont calculées en fonction de la distance et du temps, avec une commission de 12% et un tarif minimum de 5000 GNF. Pour d'autres services, comme la livraison de repas, le prix total inclut le coût du produit et du service choisi par le client, avec une commission de 12%, totalisant 44 800 GNF dans l'exemple donné. 
"""),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(4),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "Puis je connaitre le montant que je vais payer à l’avance ?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 4)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Row(
                                  children: [
                                    Text(
                                      """Oui le client est informé à l’avance du montant à régler lors de sa « commande », cela, quel que soit le service commander sur SwapeD.""",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(5),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "Qui supporte les frais de services (commission SwapeD) ?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 5)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """
Le client supporte les frais d’utilisation qui s’élève à 12% du montant total. Quant au partenaire, il supporte les frais de paiements et de retrait de la somme totale. """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(6),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "En tant que partenaire, ai-je une limite dans les transactions ?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 6)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """Oui, des limites de transactions peuvent s'appliquent aux différents types de comptes de paiements selon les conditions générales de nos partenaires (banques et monnaies électroniques) """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(6),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "En tant que partenaire, ai-je une limite dans les transactions ?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 6)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """Oui, des limites de transactions peuvent s'appliquent aux différents types de comptes de paiements selon les conditions générales de nos partenaires (banques et monnaies électroniques) """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(7),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "Quels sont les options de paiements existant ?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 7)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """Vous disposez d’une multitude de moyen de paiement allant de la certes débit / crédit, des paiements mobiles dont Momo, Orange Money, Wave ou encore de la Wallet Deally. Vous pouvez-choir l’un des moyens de paiement par défaut sur chaque service SwapeD. Quelques soit le moyen choisit, le paiement est instantané.  """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(8),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "Que se passe t’il si je souhaite faire un paiement en espèce ? ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 8)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """Vous disposez d’une multitude de moyen de paiement allant de la certes débit / crédit, des paiements mobiles dont Momo, Orange Money, Wave ou encore de la Wallet Deally. Vous pouvez-choir l’un des moyens de paiement par défaut sur chaque service SwapeD. Quelques soit le moyen choisit, le paiement est instantané.  """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(9),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "En tant que partenaire, puis-je retirer mon argent immédiatement après avoir fourni le service ?  ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 9)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """Vous disposez d’une multitude de moyen de paiement allant de la certes débit / crédit, des paiements mobiles dont Momo, Orange Money, Wave ou encore de la Wallet Deally. Vous pouvez-choir l’un des moyens de paiement par défaut sur chaque service SwapeD. Quelques soit le moyen choisit, le paiement est instantané.  """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(10),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "En tant que partenaire, puis-je retirer mon argent immédiatement après avoir fourni le service ?  ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 10)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """Oui, les partenaires peuvent retirer leur argent dans les 12 heures suivant la prestation. Par exemple, si un voyageur réserve une chambre pour 3 nuits à 500 000 GNF / Nuit et commande un repas à 50 000 GNF chez un restaurateur partenaire, l'hôte pourra retirer 1 500 000 GNF 12 heures après avoir remis les clés au voyageur, et le restaurateur pourra également retirer ses 50 000 GNF 12 heures après la réception du repas par le voyageur.   """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(11),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "En tant qu’utilisateur (non-partenaire), puis-je retirer de l’argent ?  ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 11)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """Bien que SwapeD vous propose de payer vos commandes avec la Wallet Deally (rechargeable par carte bancaire avec PayPal), l’utilisateur non-partenaire ne peut faire de retrait sur l’application. Seul le partenaire (prestataires de service) peut solliciter un retrait en raison du service fourni.    """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(12),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "Comment visualiser ma facture après l’utilisation des services de swaped ?   ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 12)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """Vous pouvez visualiser et exporter l’ensembles vos factures à tout moment en vous rendant dans votre « profil » et en sélectionnant « mes commandes ». """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(13),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "Puis-je annuler une course ou une commande ? ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 13)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """Oui. Depuis votre « profil », sélectionnez « commandes » et « annuler la commande ».  Vérifiez néanmoins les conditions d’annulation spécifiques du partenaire qui fournit le service. """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(14),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "Quel est le montant que je vais récupérer après avoir annulé ma commande ?  ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 14)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """Le montant que vous pouvez récupérer varie en fonction du partenaire, cependant, vous pouvez recevoir jusqu’à 100% du montant dépensé sous condition que le prestataire (restaurant, logement et driver) n’exige pas des frais d’annulation.  """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(15),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "Quand vais-je recevoir mon paiement ou mon remboursement ?  ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 15)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """Vous pourrez recevoir votre remboursement sous 48h pour les paiements locaux. Le paiement international varie en fonction de votre région ainsi que des conditions générales de nos votre banque et de nos partenaires de paiements. """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(16),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "Puis-je annuler une réservation (logement, transport ou un repas) qui ne correspond pas à la description ?  ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 16)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """Vous pouvez effectuer l’annulation, cependant, veillez à respecter les conditions particulières du partenaire et assurez-vous d’avoir les preuves à charges. Auquel cas, SwapeD sera votre médiateur afin de trouver une solution amiable et usera de ses capacités pour vous assister dans la limite du raisonnable.  """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(17),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "Est-il possible de commander un repas à livrer 30 minutes avant la fermeture du restaurant ?  ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 17)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """Non, vous pouvez passer commande uniquement pendant les heures d'ouverture jusqu'à une heure avant la fermeture du restaurant. Cette règle garantit la disponibilité des partenaires pour préparer et livrer votre repas à temps. """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(18),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "Comment joindre l’équipe support ?  ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 18)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """Vous pouvez contacter notre équipe par mail sur swaped@deally.fr ou encore au +224 626 50 16 51  """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(19),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "Je souhaite être un collaborateur de Swaped, comment faire ?  ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 19)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """Chez SwapeD, nous valorisant la mixité, la différence te les qualités de tout un chacun. Nous souhaitons grandir et valoriser de jour en jour les talents de demain. Vous pouvez adresser votre candidature spontanée ou en répondant à l’une de nos offres d’emploi en adressant votre CV et lettre de motivation à swaped.rh@deally.fr """,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'LOGEMENTS',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  """Conditions d'annulation acceptées par Deally, mettant la responsabilité du remboursement sur l'hôte et exigeant que le client fournisse des preuves à l'appui : """,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(21),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "ANNULATION D’UNE RESERVATION PAR L’INVITE   ?  ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 21)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """
  L’hôte est tenu de rembourser intégralement le client dans les situations suivantes, sous réserve que le client fournisse des preuves à l'appui, et ce, au plus tard douze heures avant la date du séjour. Le remboursement sera effectué par un transfert sur le portefeuille électronique du client. 

Les conditions acceptées pour cette annulation sont les suivantes : 

En cas de problèmes de santé qui obligent le client à annuler son voyage. 

En cas d'événements météorologiques, de catastrophes naturelles ou de risques sanitaires ayant un impact sur les projets de voyage du client. 

Le client peut également exiger un remboursement intégral dans les situations suivantes, mettant la responsabilité du remboursement sur l'hôte : 

L’hôte ne s'engage pas ou ne me répond pas. 

L’hôte a modifié le logement pour lequel le j’ai effectué une réservation, cela, sans obtenir mon accord préalable. 

L’hôte a remplacé le logement réservé par un autre logement sans obtenir mon accord préalable. 

L’hôte m’empêche d'accéder à la propriété dans un délai raisonnable par rapport à l'heure d'enregistrement prévue. 

Le logement n'est ni sûr (par exemple, présence d'infestations, serrures cassées ou moisissures extrêmes) ni propre (par exemple, draps sales ou détritus laissés en évidence). 

L’hôte a fourni un logement qui ne correspond pas à sa description, par exemple : 

Si la propriété est annoncée comme une maison de 4 chambres, mais que la quatrième chambre est inaccessible ou inutilisable. 

Si une piscine ou un jardin privé est mentionné, alors qu'il s'agit en réalité d'une piscine partagée. 

Si le logement est décrit comme proche d'un lieu (touristique, centre commercial ou aéroport), mais que ce lieu se trouve à plus d'une heure de route ou est inaccessible. 

 

Par ailleurs, le client doit noter que la commission d'utilisation du service de SwapeD, qui s'élève à 12%, est due pour chaque commande, quelle que soit la raison de l'annulation. 

 
""",
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(22),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "ANNULATION D’UNE RESERVATION PAR L'HOTE ?  ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 22)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """
  L’hôte peut annuler également une réservation lorsque le client (invité) ne respecte pas l’une des conditions suivantes : 

L’invité fournit des informations de contact incorrectes ou inaccessibles. 

L’invité ne se conforme pas aux règles de la propriété, notamment en perturbant la tranquillité du voisinage 

L’invité n’effectue pas le paiement des frais ou du loyer dans les 12h00 après que l’hôte ai accepté la demande de réservation. 

L’invité utilise la propriété à des fins illégales ou non autorisées 

L’invité dégrade ou endommage la propriété de manière significative 

L’invité enfreint les règles de sécurité de la propriété. 

L’invité ne respect les heures d'arrivée ou de départ convenues par le client 

L’invité ne respecte pas les règles spécifiques de la propriété concernant les animaux domestiques 

L’invité sous-loue ou partage la propriété avec des tiers sans l'autorisation expresse de l'hôte 

L’invité ne respecte pas les règles de bon voisinage et provoque des plaintes des voisins 

L’invité a un comportement irrespectueux ou de harcèlement envers l'hôte ou les autres occupants de la propriété 

L’invité ne respecte pas les règles spécifiques de la propriété concernant le bruit ou les heures de tranquillité 

L’invité ne respecte pas les règles de propreté et d'entretien de la propriété par le client. 

L’invité ne se conforme pas aux règles spécifiques de la propriété concernant l'utilisation des équipements ou des espaces communs 

Peu importe la raison, l’hôte a la possibilité d'annuler jusqu'à 2 réservations par jour. Si ce quota est dépassé, son compte pourrait faire l'objet d'une suspension temporaire.  
""",
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => faqBloc.setMenuFaq(23),
                  child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(color: noir.withOpacity(.3), blurRadius: .5)
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .02,
                              ),
                              const Text(
                                "EVALUATION DES SEJOURS PAR L’INVITE ?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                            ],
                          ),
                        ),
                        if (faqBloc.menuFaq == 23)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .02),
                                child: Text(
                                  """
  Votre évaluation contribue à améliorer l'hospitalité. Partagez-la avec nous ! 

Votre expérience globale de 1 à 5 étoiles : comment jugez-vous votre séjour ? Propreté Le logement répondait il à vos critères de choix ? 

Précision La description de l'annonce est-elle conforme au logement, avec des photos et des informations à jour ? 

Arrivée : L'arrivée s'est-elle bien déroulée ? 

Communication : Comment jugez-vous la disponibilité et la communication de l’hôte ? 

Emplacement : Avez-vous été informé de la sécurité dans le quartier, de l'accès aux moyens de transport, des points d'intérêt et des points particulières telles que le bruit ou d'autres situations susceptibles d'affecter son séjour ? 

Équipements : Tous les équipements proposés dans l'annonce étaient-ils disponibles et en état de fonctionnement ? 

Rapport qualité-prix : Le prix était-il en adéquation avec le logement ? 

Commentaire : Quel commentaire souhaiteriez-vous mettre à votre hôte ? 
""",
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                )
              ],
            ),
          ),
          Positioned(
              child: Container(
            height: 60,
            width: size.width,
            decoration: BoxDecoration(
              color: noir.withOpacity(1),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * .025,
                      ),
                      ImageIcon(
                        const AssetImage("assets/images/swape.png"),
                        size: 20,
                        color: blanc,
                      ),
                      Text(
                        'waped'.toUpperCase(),
                        style: TextStyle(color: blanc),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                MouseRegion(
                  onHover: (event) => partenaireBloc.setHoverColorFaq(),
                  onExit: (event) => partenaireBloc.exitHoverColorFaq(),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/"),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Home'.toUpperCase(),
                          style: TextStyle(color: partenaireBloc.colorHoverFaq),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MouseRegion(
                  onHover: (event) => partenaireBloc.setHoverColorAPropos(),
                  onExit: (event) => partenaireBloc.exitHoverColorAPropos(),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutUsScreen(),
                        )),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'A propos'.toUpperCase(),
                          style: TextStyle(
                              color: partenaireBloc.colorHoverAPropos),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MouseRegion(
                  onHover: (event) => partenaireBloc.setHoverColorPartenaire(),
                  onExit: (event) => partenaireBloc.exitHoverColorPartenaire(),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddPartenaireScreen(),
                        )),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Devenir partenaire'.toUpperCase(),
                          style: TextStyle(
                              color: partenaireBloc.colorHoverPartenaire),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MouseRegion(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FaqScreen(),
                        )),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'FAQ',
                          style: TextStyle(color: blanc),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MouseRegion(
                  onHover: (event) => partenaireBloc.setHoverColorLogin(),
                  onExit: (event) => partenaireBloc.exitHoverColorLogin(),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/login"),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Connexion'.toUpperCase(),
                          style:
                              TextStyle(color: partenaireBloc.colorHoverLogin),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
