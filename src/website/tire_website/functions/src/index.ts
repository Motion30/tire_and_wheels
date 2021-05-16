import * as functions from "firebase-functions";

import admin = require("firebase-admin");
admin.initializeApp();

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

export const updateLastMessage = functions.firestore.
    document("chats/{chatId}/messages/{messagesId}")
    .onCreate(async (snap, context) => {
      const data = snap.data();
      const chatsDocId: string = data.chatsDocId;
      const senderUid: string = data.senderId;
      return admin.firestore().collection("chats").doc(chatsDocId).update({
        "lastMessage": data.message,
        "receiverId": data.receiverId,
        "senderId": senderUid,
        "timestamp": data.timestamp,
        "type": data.type,
        "chatsDocId": chatsDocId,
      });
    });

// async function getUserDetails(userId: string) {
//   return await admin
//       .firestore()
//       .doc(`userData/${userId}`)
//       .get()

//       .then((value) => {
//         console.info("function executed succesfully: got user user name");
//         console.log(value);
//         if (value.exists) {
//           return value.data();
//         } else {
//           return "null";
//         }
//       })
//       .catch((error) => {
//         console.info("error in execution: unable to get user name");
//         console.log(error);
//         return {msg: "error in execution: unable to get user name"};
//       });
// }


// async function sendNotificationToUser(userId: string, message: string) {
//   const userName = await getUserDetails(userId);

//   const payload = {
//     notification: {
//       title: "You got a new message!",
//       body: `${userName}: ${message}`,
//     },
//     data: {
//       data_to_send: "msg_from_the_cloud",
//       click_action: "FLUTTER_NOTIFICATION_CLICK",
//       type: "chat",
//     },
//   };

//   const options = {
//     priority: "high",
//     timeToLive: 60 * 60 * 24,
//   };

//   return admin
//       .messaging()
//       .sendToTopic("admin_123456", payload, options)
//       .then((value: any) => {
//         console.info("function executed succesfully: sent notification");
//         return {msg: "function executed succesfully"};
//       })
//       .catch((error: any) => {
//         console.info("error in execution: notification not sent");
//         console.log(error);
//         return {msg: "error in execution: notification not sent"};
//       });
// }
