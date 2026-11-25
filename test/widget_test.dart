import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/models/project.dart';

void main() {
  test('Project.fromJson maps snake_case JSON to fields', () {
    final project = Project.fromJson({
      'id': 'abc',
      'title': 'Portfolio',
      'description': 'My app',
      'tech_stack': 'Flutter',
      'project_url': 'https://example.com',
    });

    expect(project.techStack, 'Flutter');
    expect(project.projectImageUrl, '');
  });
}