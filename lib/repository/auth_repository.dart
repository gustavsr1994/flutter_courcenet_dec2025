import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_courcenet_dec2025/models/auth/login_response.dart';
import 'package:flutter_courcenet_dec2025/models/auth/register_response.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  Dio dio = Dio();

  Future<RegisterResponse> authRegister(Map<String, dynamic> request) async {
    try {
      var response = await dio.post(
        'http://10.0.2.2:8080/register',
        data: request,
      );
      var result = RegisterResponse.fromJson(response.data);
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<LoginResponse> authLogin(Map<String, dynamic> requestParams) async {
    try {
      var response = await dio.get(
        "http://10.0.2.2:8080/login",
        queryParameters: requestParams,
      );
      var result = LoginResponse.fromJson(response.data);
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserCredential> registerEmail(String email, String password) async {
    try {
      var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      var message = '';
      if (e.code == 'weak-password') {
        print('Password terlalu lemah.');
        message = 'Password terlalu lemah.';
      } else if (e.code == 'email-already-in-use') {
        print('Email sudah terdaftar.');
        message = 'Email sudah terdaftar.';
      }
      throw Exception(message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserCredential> loginEmail(String email, String password) async {
    try {
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<GoogleSignInAccount> loginGmail() async {
    try {
      await GoogleSignIn.instance.initialize();
      var accountGoogle = await GoogleSignIn.instance.authenticate();
      return accountGoogle;
      //FirebaseAuth.instance.signInWithCredential(AuthCredential(providerId: accountGoogle., signInMethod: signInMethod));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
