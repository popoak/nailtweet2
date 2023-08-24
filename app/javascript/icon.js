// document.addEventListener("DOMContentLoaded", function() {
//   const likeButton = document.querySelector(".like-button");
//   const normalHeartIcon = document.querySelector(".normal-heart");
//   const redHeartIcon = document.querySelector(".red-heart");
  
//   if (likeButton && normalHeartIcon && redHeartIcon) {
//     likeButton.addEventListener("click", function() {
//       const prototypeId = likeButton.dataset.prototypeId; // プロトタイプのIDを取得
//       const isLiked = redHeartIcon.classList.contains("hidden"); // いいねの状態を判定
      
//       // サーバーにいいね情報を送信
//       fetch(`/prototypes/${prototypeId}/like`, {  // <- 正しいAPIエンドポイントを指定
//         method: "POST",
//         headers: {
//           "Content-Type": "application/json",
//         },
//         body: JSON.stringify({ liked: isLiked }),
//       })
//       .then(response => response.json())
//       .then(data => {
//         // カウントを更新
//         const likeCountElement = document.querySelector(".like-count");
//         likeCountElement.textContent = data.like_count;
//       })
//       .catch(error => {
//         console.error("Error:", error);
//       });
      
//       normalHeartIcon.classList.toggle("hidden");
//       redHeartIcon.classList.toggle("hidden");
//     });
//   }
// });