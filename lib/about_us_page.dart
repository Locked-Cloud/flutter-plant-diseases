import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  final List<TeamMember> teamMembers = [
    TeamMember(name: 'Ibrahim Ahmed', role: 'Computer Engineer', imageUrl: 'https://example.com/team_member1_image.jpg', url: 'https://static.vecteezy.com/system/resources/thumbnails/000/429/651/small/1312.i011.022.S.i011.c10.COMING_SOON.jpg'),
    TeamMember(name: 'Ezz El Dlen Ahmed', role: 'Computer Engineer', imageUrl: 'https://example.com/team_member2_image.jpg', url: 'https://static.vecteezy.com/system/resources/thumbnails/000/429/651/small/1312.i011.022.S.i011.c10.COMING_SOON.jpg'),
    TeamMember(name: 'Abdelrahman Sheneshen', role: 'Computer Engineer', imageUrl: 'https://example.com/team_member3_image.jpg', url: 'https://static.vecteezy.com/system/resources/thumbnails/000/429/651/small/1312.i011.022.S.i011.c10.COMING_SOON.jpg'),
  ];

  final TeamMember projectManager = TeamMember(
    name: 'Eng.Ahmed Thabet',
    role: 'Project Manager',
    imageUrl: 'https://example.com/manager_image.jpg',
    url: 'https://static.vecteezy.com/system/resources/thumbnails/000/429/651/small/1312.i011.022.S.i011.c10.COMING_SOON.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CachedNetworkImage(
                  imageUrl: 'https://instagram.fcai19-4.fna.fbcdn.net/v/t51.2885-19/395106494_346767821191386_2337811762719574868_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fcai19-4.fna.fbcdn.net&_nc_cat=106&_nc_ohc=wKDzY8Bq3bcQ7kNvgHvKiUE&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AYB9fXO7IChCuTa3tysn37hDJCOdlBozJvhi1tIWWv3yvA&oe=669BA33D&_nc_sid=8b3546',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: 200,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Project Manager',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(projectManager.imageUrl),
                ),
                title: GestureDetector(
                  onTap: () => _launchURL(projectManager.url),
                  child: Text(
                    projectManager.name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                subtitle: Text(projectManager.role),
              ),
              SizedBox(height: 20),
              Text(
                'Team Members',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ...teamMembers.map((member) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(member.imageUrl),
                    ),
                    title: GestureDetector(
                      onTap: () => _launchURL(member.url),
                      child: Text(
                        member.name,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    subtitle: Text(member.role),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class TeamMember {
  final String name;
  final String role;
  final String imageUrl;
  final String url;

  TeamMember({required this.name, required this.role, required this.imageUrl, required this.url});
}
