# mobil_uygulama_proje-030721087-TasneemAladra

# Dictionary App

## Projenin Amacı
Kullanıcılara kelime tanımlarına, telaffuzlara, çevirilere, eş anlamlılara, zıt anlamlılara ve örnek kullanımlara hızlı, doğru ve kolay erişim sağlamak; böylece kelime dağarcıklarını, dil becerilerini ve genel iletişim yeteneklerini geliştirmek.

## Teknik Detaylar
- **Framework:** Flutter (Dart dili)
- **Backend:** Firebase Authentication
- **State Management:** `setState`, `Navigator`
- **Veri Saklama:** Kullanıcı oturumu Firebase üzerinden yönetilir.
- **Platform Desteği:** Android, Web, iOS

## Öne Çıkan Özellikler
- Firebase Authentication entegrasyonu
- Kayıt olma ve giriş yapma ekranları
- Giriş sonrası yönlendirme ve oturum yönetimi
- Modüler sayfa yapısı
- Basit ama anlaşılır UI düzeni

## Kullanılan Teknolojiler
- [Flutter](https://flutter.dev/) – UI geliştirme
- [Dart](https://dart.dev/) – Programlama dili
- [Firebase Authentication](https://firebase.google.com/products/auth) – Kullanıcı yönetimi
- [Android Studio](https://developer.android.com/studio) – Geliştirme ortamı

## Sayfaların Görevleri ve İçerikleri
- **Home Sayfası:
  - Bu sayfa kullanıcıya iki seçenek sunar, kaydol veya oturum aç. Mevcut kullanıcılar oturum açma bilgilerini girmek ve hesaplarına erişmek için oturum açma düğmesini kullanabilirler. Yeni kullanıcılar kaydol düğmesine tıklar ve bir kaydolma sayfasına yönlendirilir
- **SignUp Sayfası:
  - Bu sayfa, kullanıcının yeni hesabını nasıl oluşturmak istediğini seçmesine olanak tanır. 3 seçenek mevcuttur; Google ile kaydolma, GitHub üzerinden kaydolma ve e-posta ile kaydolma.
- LogIn Sayfası:
  - Mevcut kullanıcılar bu sayfayı oturum açma bilgilerini girmek ve hesaplarına erişmek için kullanırlar
- **GoogleSignIn Sayfası:
  - Bu sayfa, bir kullanıcının önceden var olan bir Google hesabı aracılığıyla kaydolmasına olanak sağlamak için Firebase kimlik doğrulama yöntemlerini kullanır.
- **GitHubSignIn Sayfası:
  - Bu sayfa, kullanıcıların GitHub hesabı ile Firebase Authentication üzerinden kimlik doğrulaması yaparak uygulamaya giriş yapmasını sağlar.
- **EngSearch Sayfası:
  - EngSearch sayfası, İngilizce bir kelimenin aratıldığı kullanıcı arayüzüdür. Kullanıcıdan bir kelime alır ve bu kelimeyi ResultScreen adlı sonuç sayfasına göndererek anlamının gösterilmesini sağlar.
- **Result Sayfası:
  - Bu sayfa EngSearch sayfasında yapılan kelime aramasının sonucunu görüntüler.
- **Settings Sayfası:
  - Ayarlar sayfası, temanın açık moddan koyu moda değiştirilmesi, profil sayfasına erişim, bildirimler vb. gibi temel uygulama ayarlarını içerir.
  - Ayarlar sayfası main sayfasında yer alır ve DrawerMenu aracılığıyla erişilir.
- **Profile Sayfası:
  - Profil sayfası, kullanıcı kimliği, ad, e-posta, telefon numarası ve adres gibi kullanıcı bilgilerini tutar. Bu bilgiler, Supabase API'si aracılığıyla Supabase sunucuları kullanılarak bir veritabanında saklanır. 
  - Bilgiler ayrıca sharedPreferences kullanılarak yerel olarak saklanır. 
  - Bu sayfa, kullanıcı verilerini kaydetme, veritabanından kullanıcı verilerini alma ve kullanıcı verilerini güncelleme yöntemlerini içerir.
  - Profil sayfası main sayfasında yer alır ve DrawerMenu aracılığıyla erişilir.


## Login Bilgilerinin Saklanması
- Kullanıcının giriş bilgileri Firebase Authentication kullanılarak güvenli bir şekilde saklanmaktadır. Uygulama, kimlik doğrulama işlemleri için Firebase SDK’yı kullanır.

## Firebase Authentication Kullanıcı Bilgileri
- Firebase e-posta ve şifre ile kimlik doğrulama yöntemi kullanılmaktadır.
- `firebase_core` ve `firebase_auth` paketleriyle kullanıcı kayıt, giriş ve oturum kontrol işlemleri yapılır.
- Başarılı giriş sonrası kullanıcı Firebase üzerinden doğrulanır ve uygulama içinde oturum yönetimi sağlanır.

## Modülerlik ve Kod Yapısı
- Her ekran ayrı bir dosya olarak yapılandırılmıştır.
- `Navigator.push` ve `MaterialPageRoute` yapıları ile sayfalar arası geçiş yapılır.
- Kod yapısı sade ve genişletilmeye uygun olacak şekilde modüler olarak tasarlanmıştır.
- Kodlar okunabilirlik ve sürdürülebilirlik göz önünde bulundurularak yazılmıştır.

## Geliştirme Ortamı
- **IDE:** Android Studio / VS Code
- **Flutter SDK:** 3.x+
- **Firebase Console:** Kullanıcı yönetimi ve kimlik doğrulama ayarları
- **Supabase:** Kullanıcı bilgilerin veritabanında saklanması
- **Cihaz:** Android Emulator, Web Emulator


## Grup Üyelerin Katkısı:
- Gruptaki tek üye kendim olduğum için tüm katkılar şahsım tarafından sağlandı.