import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:istegram/data/sevice/show_alert_dialog.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> signInWithEmailAndPassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    // Eğer e-posta veya şifre boş ise kullanıcıya bildirim göster.
    if (email.isEmpty || password.isEmpty) {
      showAlertDialog(
        context: context,
        message: 'Lütfen bir e-posta adresi ve şifre girin.',
      );
      return;
    }

    try {
      // Firebase ile kullanıcı giriş işlemi.
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // Kullanıcı bilgilerini Firestore'a kaydet.
      await _storeUserInfo(userCredential.user!.uid, email);

      // Giriş başarılı ise bir sonraki sayfaya yönlendirme.
      Navigator.pushNamed(context, '/liquidTab');
    } on FirebaseAuthException catch (e) {
      // Hata durumunda özel bir hata işleyiciye yönlendirme.
      _handleAuthError(context, e);
    }
  }

  /// Kullanıcı bilgilerini Firestore'a kaydetme
  Future<void> _storeUserInfo(String uid, String email) async {
    await _firebaseFirestore.collection("Users").doc(uid).set(
      {
        'uid': uid,
        'email': email,
      },
      SetOptions(merge: true), // Mevcut verilerle birleştirme
    );
  }

  /// Firebase Hatalarını Yönetme
  void _handleAuthError(BuildContext context, FirebaseAuthException e) {
    String errorMessage;

    // Firebase hata kodlarına göre özel mesajlar
    switch (e.code) {
      case 'invalid-credential':
        errorMessage = 'Lütfen e-posta adresinizi veya şifrenizi kontrol edin.';
        break;
      case 'invalid-email':
        errorMessage =
            'Geçersiz e-posta adresi. Lütfen e-posta formatını kontrol edin.';
        break;
      case 'user-not-found':
        errorMessage = 'Bu e-posta ile kayıtlı bir kullanıcı bulunamadı.';
        break;
      case 'wrong-password':
        errorMessage = 'Şifreniz hatalı. Lütfen tekrar deneyin.';
        break;
      case 'network-request-failed':
        errorMessage = 'İnternet bağlantınız yok. Lütfen bağlantınızı kontrol edin.';
        break;
      default:
        errorMessage = 'Bilinmeyen bir hata oluştu: ${e.code}';
    }

    // Hata mesajını kullanıcıya gösterme
    showAlertDialog(context: context, message: errorMessage);
  }
}
