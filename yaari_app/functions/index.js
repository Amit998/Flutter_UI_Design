const functions = require('firebase-functions');
const admin= require('firebase-admin')
admin.initializeApp();


exports.onCreateFollower=functions.firestore.document
.document("/followers/{userId}/userFollowers/{followerId}")
.onCreate( async (snapshot, context) =>{
    console.log("follower created",snapshot.data());
    const userId = context.params.userId;
    const followerId=context.params.followerId;

    // Get FollowedUser Posts


    // create followed users posts ref

    const followedUserPostsRef = admin
    .firestore()
    .collection('posts')
    .doc(userId)
    .collection('userPosts');

    // create following user's timeline ref
    const timelinePostsRef=admin
    .firestore()
    .collection('timeline')
    .doc(followerId)
    .collection('timelinePosts')


    // Get followed users posts

    const querySnapshot= await followedUserPostRef.get();

    // add each users to following user's timeline

    querySnapshot.forEach(doc =>{
        if(doc.exists){
            const postId= doc.id;
            const postData= doc.data();
            timelinePostsRef.doc(postId).set();
        }
    });


});

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
