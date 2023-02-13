import 'package:diox/diox.dart';
import 'package:repo_viewer/core/infrastructure/remote_responses.dart';
import 'package:repo_viewer/github/core/infrastructure/github_repo_dto.dart';

class StarredReposRemoteService {
  final Dio _dio;

  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredReposPage(
    int page,
  ) async {}
}
