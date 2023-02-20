import 'package:diox/diox.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/core/infrastructure/sembase_database.dart';

final sembastProvider = Provider((ref) => SembastDatabase());

final dioProvider = Provider((ref) => Dio());
