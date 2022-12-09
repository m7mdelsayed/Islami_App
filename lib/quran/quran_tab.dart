import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/quran/sura_name_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'num_of_ayat.dart';

class QuranTab extends StatelessWidget {
static const routeName='quran-tab';
List<String>suraName=["الفاتحة","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
  ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
  ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
  ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
  ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
  ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
  ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
  ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
  "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];
List<String>suraNameEnglish=[
  "Al-Fateha","Al-Bakara","Al-Emran","Al-Nesaa","Al-Maeda","Al-Anaam","Al-Aaraf",
  "Al-Anfal","Al-Tawba","Younos","Hood","Yusuf","Al-Raad","Ibrahim","Al-Hejr",
  "Al-Nahl","Al-Esraa","Al-Kahf","Mariam","Taha","Al-Anbiaa","Al-Haj","Al-Moamenon",
  "Al-Nour","Al-Forkan","Al-Shoaraa","Al-Naml","Al-Kasas","Al-Ankabot","Al-Rom",
  "Lokman","Al-Sajda","Al-Ahzab","Sabaa","Fater","Yassein","Al-Saffat","Sadd",
  "Al-Zomar","Ghafer","Fosselat","Al-Shora","Al-Zokhrof","Al-Dokhan","Al-Jathia",
  "Al-Ahkaf","Muhammad","Al-Fath","Al-Hojorat","kaf","Al-Zariat","Al-Tor","Al-Najm",
  "Al-Kamar","Al-Rahman","Al-Wakea","Al-Hadid","Al-Mojadala","Al-Hashr","Momtahana",
  "Al-Saf","Al-Jomoa","Al-Monafekon","Al-Taghabon","Al-Talak","Al-Tahreem","Al-Molk",
  "Al-kalam","Al-Hakka","Al-Maarej","Nouh","Al-Jen","Al-Mozamil","Al-Modather",
  "Al-Keiama","Al-Ensan","Al-Morssalat","Al-Nabaa","Al-Nazeat","Abasa","Al-Takwir",
  "Al-Enfetar","Al-Motaffefin","Al-Enshekak","Al-Boroj","Al-Tarek","Al-Aala","Al-Ghashia",
  "Al-Fajr","Al-Balad","Al-Shams","Al-Lail","Al-Doha","Al-Sharh","Al-Teen","Al-Alak",
  "Al-kadr","Al-Baiena","Al-Zalzala","Al-Adiat","Al-Karea","Al-Takathor","Al-Asr",
  "Al-Homaza","Al-Feel","Koraish","Al-Maaon","Al-Kawthar","Al-Kaferon","Al-Nasr",
  "Al-Masad","Al-Ekhlas","Al-Falak","Al-Nas"
];
List<String>numOfAyah=['7','286','200','176','120','165','206','75','129',
  '109','123','111','43','52','99','128','111','110','98','135','112','78',
  '118','64','77','227','93','88','69','60','34','30','73','54','45','83',
  '182','88','75','85','54','53','89','59','37','35','38','29','18','45',
  '60','49','62','55','78','96','29','22','24','13','14','11','11','18',
  '12','12','30','52','52','44','28','28','20','56','40','31','50','40',
  '46','42','29','19','36','25','22','17','19','26','30','20','15','21',
  '11','8','8','19','5','8','8','11','11','8','3','9','5','4','7','3','6',
  '3','5','4','5','6'];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Image.asset('assets/images/background_header.png'),),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:10),
            child: Row(
              children:  [
                const SizedBox(width: 28,),
                Text(AppLocalizations.of(context)!.num_of_ayat,style:Theme.of(context).textTheme.headline6,),
                const Spacer(),
                Text(AppLocalizations.of(context)!.sura_name,style: Theme.of(context).textTheme.headline6,),
                const Spacer(),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Expanded(
            flex: 5,
            child: ListView.separated(itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumOfAyat(numOfAyah[index]),
                  Container(
                    width: 2,
                    height: 60,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  SuraNameWidget(
                      settingsProvider.isArabic()
                          ? suraName[index]
                          :suraNameEnglish[index]
                      ,index
                  ),
                ],);
            }, separatorBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Theme.of(context).colorScheme.secondary,
              );
            },
                itemCount: suraName.length),
          ),
        ],
      ),
    );
  }
}
