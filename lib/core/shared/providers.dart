import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/core/infrastructure/sembase_database.dart';

final sembastProvider = Provider((ref) => SembastDatabase());
