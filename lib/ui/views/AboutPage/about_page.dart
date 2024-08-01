import 'package:flutter/material.dart';
import 'package:seslen_app/common/constants/image_strings.dart';
import 'package:seslen_app/core/utils/themes/custom_colors.dart';
import 'package:seslen_app/ui/components/custom_appbar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  get mainAuxiliaryColor => null;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFFFDD00).withOpacity(0.8),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.yellow[200],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          ImagePaths.aboutImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'İşitme Engelliler için İletişimi Kolaylaştırmak',
                      style: TextStyle(
                        fontFamily: 'OhChewy',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Hoş geldiniz! SesLen, işitme engellilerin ve işaret dili kullanıcılarının iletişimdeki engelleri aşmalarına yardımcı olmak amacıyla tasarlanmış bir uygulamadır. İşte SesLenin amaçları ve özellikleri: ',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: mainAuxiliaryColor,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Amaçlarımız:',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: mainAuxiliaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'İşitme Engelliler için İşaret Dili Çevirisi: SesLen, işitme engellilerin ve işaret dili kullanıcılarının günlük yaşamlarında iletişim kurmalarını kolaylaştırmak için işaret dilini metne veya söze çevirir.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: mainAuxiliaryColor,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Kapsamlı İşaret Dili Kütüphanesi: Uygulamamız, işaret dilinin farklı varyasyonlarına ve kategorilerine erişim sağlar. Kullanıcılarımız, herhangi bir konuda işaret dilini kullanarak kendilerini ifade edebilirler.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: mainAuxiliaryColor,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Neden SesLen?',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: mainAuxiliaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'SesLen, işitme engellilerin ve işaret dili kullanıcılarının günlük yaşamlarını kolaylaştırmak için tasarlanmıştır. İletişim engellerini aşmak, işitme engellilerin daha bağımsız ve kendilerini ifade edebilmelerini sağlar. SesLeni kullanarak, işaret dilini bilmeyenler de işitme engellilerle daha etkili bir şekilde iletişim kurabilirler.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: mainAuxiliaryColor,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Herhangi bir sorunuz, geri bildiriminiz veya öneriniz varsa, lütfen bizimle iletişime geçmekten çekinmeyin. SesLeni kullanmaya başladığınız için teşekkür ederiz. İyi iletişimler!',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: mainAuxiliaryColor,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
