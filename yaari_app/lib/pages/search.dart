import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yaari_app/models/user.dart';
import 'package:yaari_app/pages/activity_feed.dart';
import 'package:yaari_app/widgets/progress.dart';
import '../pages/home.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  Future<QuerySnapshot> searcResultFuture;

  handleSearch(String query) {
    Future<QuerySnapshot> users = userRef
        // .where("displayName", isGreaterThanOrEqualTo: query)
        .where("username", isGreaterThanOrEqualTo: query)
        .getDocuments();
    setState(() {
      searcResultFuture = users;
    });
  }

  buildSearchResults() {
    return FutureBuilder(
        future: searcResultFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print(snapshot.data);
            return circularProgress();
          }
          List<UserResult> searchResults = [];
          snapshot.data.documents.forEach((doc) {
            User userData = User.fromDocument(doc);
            UserResult searchResult = UserResult(userData);
            searchResults.add(searchResult);
          });
          return ListView(
            children: searchResults,
          );
        });
  }

  clearSearch() {
    searchController.clear();
  }

  AppBar buildSearchBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
            hintText: "Search For User",
            filled: true,
            prefixIcon: Icon(
              Icons.account_balance,
              size: 28.0,
            ),
            suffixIcon: InkWell(
              onTap: () => clearSearch(),
              child: Icon(
                Icons.clear,
              ),
            )),
        onFieldSubmitted: handleSearch,
      ),
    );
  }

  Container buildNoContent() {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            SvgPicture.asset(
              "assets/images/search.svg",
              height: orientation == Orientation.portrait ? 300.0 : 200.0,
            ),
            Text(
              "Find User",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontSize: 60.0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(searcResultFuture);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.7),
      appBar: buildSearchBar(),
      body: searcResultFuture == null ? buildNoContent() : buildSearchResults(),
    );
  }
}

class UserResult extends StatelessWidget {
  final User user;

  UserResult(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.2),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => showProfile(context, profileId: user.id),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(user.photoUrl),
              ),
              title: Text(
                user.displayName,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                user.username,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Divider(
            height: 2.0,
            color: Colors.white54,
          )
        ],
      ),
    );
  }
}
