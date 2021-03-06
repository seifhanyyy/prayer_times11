import * as functions from "firebase-functions";

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
exports.scheduledFunction=
functions.pubsub.schedule("every 5 minutes").onRun((context) => {
console.log("This will be run every 5 minutes!");
return null;
});
