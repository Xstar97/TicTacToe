# TicTacToe

A new Flutter project.

## Getting Started

when building this project for web....
to run in debug edit index.html

create a firebase web app in the console if you havent done so and and copy the cdn to replace the original scripts

    <!-- The core Firebase JS SDK is always required and must be listed first -->
    <script src="https://www.gstatic.com/firebasejs/7.9.3/firebase-app.js"></script>
    
    <!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
    <script src="https://www.gstatic.com/firebasejs/7.9.3/firebase-analytics.js"></script>

    <script>
    // Your web app's Firebase configuration
    var firebaseConfig = {
      apiKey: "api key here",
    authDomain: "auth domain",
    databaseURL: "db url",
    projectId: "proj id",
    storageBucket: "bucket",
    messagingSenderId: "senderId",
    appId: "appID",
    measurementId: "G-BLA"
    };
    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
    firebase.analytics();
    </script>
	
However use this in production/uploading code to a open source database(ie github)

    <!-- The core Firebase JS SDK is always required and must be listed first -->
    <script src="/__/firebase/7.9.3/firebase-app.js"></script>
    <script src="/__/firebase/7.9.3/firebase-analytics.js"></script>
    <script src="/__/firebase/7.9.3/firebase-auth.js"></script>
    <script src="/__/firebase/7.9.3/firebase-firestore.js"></script>

    <!-- Initialize Firebase -->
    <script src="/__/firebase/init.js"></script>	


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
