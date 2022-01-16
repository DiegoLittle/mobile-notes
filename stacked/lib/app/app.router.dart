// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../datamodels/note_model.dart';
import '../ui/auth/auth_view.dart';
import '../ui/auth/create_account_view.dart';
import '../ui/auth/login.dart';
import '../ui/new_note/new_note_view.dart';
import '../ui/new_task/new_task_view.dart';
import '../ui/note/note_view.dart';
import '../ui/second/second_view.dart';
import '../ui/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/start-up-view';
  static const String secondView = '/second-view';
  static const String noteView = '/note-view';
  static const String authView = '/auth-view';
  static const String loginView = '/';
  static const String newNoteView = '/new-note-view';
  static const String createAccountView = '/create-account-view';
  static const String newTaskView = '/new-task-view';
  static const all = <String>{
    startUpView,
    secondView,
    noteView,
    authView,
    loginView,
    newNoteView,
    createAccountView,
    newTaskView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.secondView, page: SecondView),
    RouteDef(Routes.noteView, page: NoteView),
    RouteDef(Routes.authView, page: AuthView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.newNoteView, page: NewNoteView),
    RouteDef(Routes.createAccountView, page: CreateAccountView),
    RouteDef(Routes.newTaskView, page: NewTaskView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    SecondView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const SecondView(),
        settings: data,
      );
    },
    NoteView: (data) {
      var args = data.getArgs<NoteViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => NoteView(
          key: args.key,
          edditingNote: args.edditingNote,
        ),
        settings: data,
      );
    },
    AuthView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const AuthView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    NewNoteView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const NewNoteView(),
        settings: data,
      );
    },
    CreateAccountView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const CreateAccountView(),
        settings: data,
      );
    },
    NewTaskView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const NewTaskView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// NoteView arguments holder class
class NoteViewArguments {
  final Key? key;
  final Note edditingNote;
  NoteViewArguments({this.key, required this.edditingNote});
}
