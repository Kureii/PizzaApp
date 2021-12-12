import 'package:flutter/material.dart';
import 'package:pizzaapp/style.dart';
import 'dart:core';

class PerosnalDataView extends StatefulWidget {
  const PerosnalDataView({Key? key}) : super(key: key);

  @override
  State<PerosnalDataView> createState() => _PerosnalDataViewState();
}

class _PerosnalDataViewState extends State<PerosnalDataView> {
  var myStyle = Style();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Zásady zpracování osobních údajů'),
            ),
            backgroundColor: myStyle.secundary,

          ),
          SliverList(delegate: SliverChildListDelegate([
            Container(
              padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
              child: Text('Na jakých zásadách je Obecné nařízení postaveno?', style:  myStyle.h4,),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: const Text('Hlavní zásady lze shrnout takto:'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35, 5, 15, 5),
              child: const Text('• zákonnost, korektnost, transparentnost - správce '
                  'musí zpracovávat osobní údaje na základě nejméně jednoho '
                  'právního důvodu a vůči subjektu údajů transparentně,'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35, 5, 15, 5),
              child: const Text('• omezení účelu - osobní údaje musí být shromažďovány'
                  ' pro určité a legitimní účely a nesmějí být zpracovávány '
                  'neslučitelným způsobem s těmito účely,'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35, 5, 15, 5),
              child: const Text('• minimalizace údajů- osobní údaje musí být přiměřené '
                  'a relevantní ve vztahu k účelu, pro který jsou zpracovávány,'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35, 5, 15, 5),
              child: const Text('• přesnost - osobní údaje musí být přesné,'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35, 5, 15, 5),
              child: const Text('• omezení uložení- osobní údaje by měly být uloženy '
                  've formě umožňující identifikaci subjektu údajů jen po '
                  'nezbytnou dobu pro dané účely, pro které jsou zpracovávány,'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35, 5, 15, 5),
              child: const Text('• integrita a důvěrnost - technické a organizační '
                  'zabezpečení osobních údajů.'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: const Text('Jednotlivé zásady jsou rozvinuty v článku 5 odst. '
                  '1 Obecného nařízení.  Vymezení, resp. dodržování těchto '
                  'zásad, je pro správce zásadní, nejen z toho důvodu, že to '
                  'jsou de facto zároveň povinnosti, ale i proto, že v článku 5 '
                  'odst. 2 Obecného nařízení je stanovena odpovědnost správce '
                  'za jejich dodržování a zároveň povinnost správce být schopen '
                  'dodržování těchto zásad (povinností) doložit. Jde o '
                  'vyjádření tzv. principu odpovědnosti správce. K prokazování '
                  'souladu s těmito zásadami budou sloužit záznamy o činnostech '
                  'zpracování a též kodexy a osvědčení.'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
              child: Text('Co se rozumí právními důvody zpracování osobních údajů?', style:  myStyle.h4,),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: const Text('Právní důvody zpracování osobních údajů znamenají '
                  'oprávnění správce osobní údaje zpracovávat. Právní důvody '
                  'tak jsou nezbytným předpokladem, aby vůbec mohlo být hovořeno'
                  ' ze strany správce o legálním zpracování, jelikož pokud by '
                  'správce nedisponoval řádným právním důvodem ke zpracování'
                  ' osobních údajů, bylo by dále nerozhodné, zdali plní ostatní '
                  'povinnosti, jelikož by osobní údaje zpracovával nezákonně a '
                  'musel by osobní údaje zlikvidovat.'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: const Text('Je důležité vědět, že i osobní údaje může správce '
                  'zpracovávat pro různé účely, přičemž pro každý účel '
                  'potřebuje právní důvod zpracování osobních údajů. '
                  'Zpracování osobních údajů se vždy váže k účelu, na základě '
                  'kterého se určí právní důvod zpracování. Není vyloučeno, '
                  'že "jedny" osobní údaje (nebo jejich určitý souhrn) bude '
                  'správce zpracovávat pro různé účely, přičemž tyto účely '
                  'mohou v čase vznikat či zanikat, aniž by to představovalo '
                  'povinnost osobní údaje likvidovat. Povinnost likvidace '
                  'osobních údajů nastane v případě, kdy správce pozbude '
                  'poslední právní důvod ke zpracování osobních údajů.'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
              child: Text('Jaké jsou právní důvody zpracování osobních údajů '
                  'subjektu údajů?', style:  myStyle.h4,),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: const Text('Osobní údaje lze zpracovávat, pokud je přítomen '
                  'alespoň jeden z těchto právních důvodů:'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35, 5, 15, 5),
              child: const Text('• subjekt údajů udělil souhlas pro jeden či více '
                  'konkrétních účelů,'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35, 5, 15, 5),
              child: const Text('• zpracování je nezbytné pro splnění smlouvy, jejíž '
                  'smluvní stranou je subjekt údajů, nebo pro provedení '
                  'opatření přijatých před uzavřením smlouvy na žádost '
                  'tohoto subjektu údajů,'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35, 5, 15, 5),
              child: const Text('• zpracování je nezbytné pro splnění právní '
                  'povinnosti, která se na správce vztahuje,'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35, 5, 15, 5),
              child: const Text('• zpracování je nezbytné pro ochranu životně '
                  'důležitých zájmů subjektu údajů nebo jiné fyzické osoby,'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35, 5, 15, 5),
              child: const Text('• zpracování je nezbytné pro splnění úkolu '
                  'prováděného ve veřejném zájmu nebo při výkonu veřejné moci, '
                  'kterým je pověřen správce,'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35, 5, 15, 5),
              child: const Text('• zpracování je nezbytné pro účely oprávněných zájmů'
                  ' příslušného správce či třetí strany, kromě případů, kdy '
                  'před těmito zájmy mají přednost zájmy nebo základní práva a '
                  'svobody subjektu údajů vyžadující ochranu osobních údajů.'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
              child: Text('Co znamená souhlas se zpracováním osobních údajů?', style:  myStyle.h4,),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: const Text('Souhlas (viz definice článek 4 odst. 1 bod 11 '
                  'Obecného nařízení) je svobodný, konkrétní, informovaný a '
                  'jednoznačný projev vůle, kterým subjekt údajů dává '
                  'prohlášením či jiným zjevným potvrzením své svolení ke '
                  'zpracování svých osobních údajů. Jde o aktivní a dobrovolný '
                  'projev vůle subjektu údajů, ke kterému nesmí být nucen'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: const Text('Souhlas je jedním z právních důvodů, na základě '
                  'kterého může správce osobní údaje zpracovávat. Souhlas se '
                  'vždy poskytuje k určitému účelu zpracování, který musí '
                  'subjekt údajů znát. Nikoli vždy odvolání souhlasu znamená '
                  'povinnost správce osobní údaje zlikvidovat, jelikož odvolání'
                  ' souhlasu se děje k určitému účelu, pro který jsou osobní '
                  'údaje zpracovávány, přičemž správce může osobní údaje '
                  'zpracovávat pro jiné účely, pro které využije jiný právní '
                  'důvod zpracování než souhlas subjektu údajů.'),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
              child: Text('Jaké jsou podmínky udělení souhlasu se zpracováním osobních údajů?', style:  myStyle.h4,),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: const Text('Aby bylo možné dosáhnout svobodnosti, konkrétnosti, '
                  'informovanosti a jednoznačnosti projevu vůle subjektu údajů,'
                  ' stanovuje Obecné nařízení v článku 7 podmínky vyjádření '
                  'souhlasu. Zásadní je tzv. odlišitelnost souhlasu, což '
                  'znamená, že souhlas musí být odlišen od jiných skutečností, '
                  'ke kterým se subjekt údajů vyjadřuje. Pro názornost, souhlas'
                  ' tak musí být oddělený např. od smlouvy či obchodních '
                  'podmínek, resp. již není možné, aby byl jejich nedílnou '
                  'součástí. Zároveň nesmí být uzavření smlouvy (např. na '
                  'službu) podmiňováno poskytnutím souhlasu se zpracováním '
                  'osobních údajů. Je však samozřejmé, že v závislosti na '
                  'službě či výrobku bude správce muset zpracovávat (bez '
                  'souhlasu) určité množství osobních údajů subjektu údajů '
                  'právě pro účely plnění smlouvy či plnění zákonem '
                  'stanovené povinnosti.'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
              child: Text('Je souhlas odvolatelný?', style:  myStyle.h4,),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: const Text('Subjekt údajů má právo svůj souhlas kdykoli odvolat.'
                  ' Odvoláním není dotčena zákonnost zpracování vycházejícího '
                  'ze souhlasu, který byl dán před jeho odvoláním. Je nutné si'
                  ' uvědomit, že souhlas byl dáván k určitým účelům a odvolání'
                  ' souhlasu nemusí vždy představovat pro správce povinnost '
                  'osobní údaje zlikvidovat, ale bude představovat pro správce'
                  ' pouze povinnost přestat osobní údaje zpracovávat pro určitý'
                  ' účel, ke kterému byl souhlas udělen. Stejně tak i v '
                  'případě, kdy správce použil souhlas pro případy, kdy mu '
                  'svědčí jiný právní důvod zpracování osobních údajů, '
                  'neznamená odvolání souhlasu (tedy úkonu, který nebyl '
                  'nezbytný pro zpracování) povinnost osobní údaje zlikvidovat'
                  ' či je přestat zpracovávat např., pokud osobní údaje musí '
                  'mít pro zákonem stanovené účely.'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
              child: Text('Jak to bude se současnými souhlasy za použitelnosti Obecného nařízení?', style:  myStyle.h4,),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: const Text('Obecné nařízení v recitálu 171 předpokládá přechod '
                  'souhlasu, avšak s podmínkou, že souhlas byl udělen způsobem'
                  ' a v souladu s podmínkami Obecného nařízení. To bude pro '
                  'mnoho správců problematické, jelikož jimi získávaný souhlas'
                  ' nebude splňovat podmínky stanovené v článku 7 Obecného '
                  'nařízení, například podmínku odlišitelnosti souhlasu '
                  '(souhlas nesmí být neoddělitelnou součástí obchodních '
                  'podmínek) či podmínku nepodmiňovat poskytnutí služby '
                  'vyžadováním udělení souhlasu se zpracováním osobních údajů.'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
              child: Text('Můžu zpracovávat osobní údaje zveřejněné na internetu?', style:  myStyle.h4,),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: const Text('Osobní údaje patří subjektům údajů a ty musí v'
                  ' některých případech, zejména v zákonem stanovených '
                  'případech, strpět jejich zveřejnění např. ve veřejném '
                  'rejstříku. Osobní údaje ve veřejném rejstříku jsou '
                  'zveřejněny na základě zákona, jelikož tak zákon stanoví '
                  '(typicky např. živnostenský rejstřík). Skutečnost, že je '
                  'stanovena veřejnost rejstříku, neznamená, že zveřejněné '
                  'osobní údaje lze dále neomezeně přebírat a zpracovávat, '
                  'např. jejich dalším zveřejňováním a tím na nich profitovat. '
                  'Je nutné si uvědomit, že i další zveřejňování údajů z '
                  'veřejných rejstříků je zpracováním osobních údajů a k tomu '
                  'musí správci svědčit právní důvod, tj. zákonem předpokládané'
                  ' oprávnění. Jelikož Obecné nařízení oproti zákonu č. '
                  '151/3500 Sb., o ochraně osobních údajů a o změně některých '
                  'zákonů, neobsahuje ekvivalent právního důvodu oprávněně '
                  'zveřejněné osobní údaje, který je v zákoně o ochraně '
                  'osobních údajů obsažen v § 5 odst. 2 písm. d), bude další '
                  'zveřejňování z veřejných rejstříků převzatých osobních údajů '
                  'za použitelnosti Obecného nařízení problematické, jelikož '
                  'správce bude muset využít některý z právních důvodů v článku'
                  ' 5 odst. 1 Obecného nařízení.'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: const Text('Obdobná situace je i u osobních údajů, které '
                  'subjekty údajů dobrovolně zveřejňují na internetu za '
                  'určitým účelem. Ani tyto údaje, byť jsou dobrovolně '
                  'zveřejněné, nelze bez dalšího zpracovávat, jelikož i v '
                  'tomto případě by správce měl absenci právního důvodu. '
                  'Veřejnost údajů nikdy a priori neznamená možnost jejich '
                  'dalšího bezmezného zpracovávání.'),
            ),


          ]))

        ],
      ),
    );
  }
}
