if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      let itemImageNum = document.querySelectorAll('.item-image').length

      // 画像を表示するためのdiv要素を生成
      const itemImage = document.createElement('div');
      itemImage.setAttribute('class', "item-image")

      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('width', '300px');

      // 生成したHTMLの画像要素をブラウザに表示させる
      itemImage.appendChild(blobImage);
      ImageList.appendChild(itemImage);
      if (itemImageNum > 1) {
        return;
      } else {
        // ファイル選択ボタンを生成
        const inputHTML = document.createElement('input')
        inputHTML.setAttribute('id', `item-image_${itemImageNum}`)
        inputHTML.setAttribute('name', 'item[images][]')
        inputHTML.setAttribute('type', 'file')
        // 生成したHTMLのinput要素をブラウザに表示させる
        itemImage.appendChild(inputHTML);
        inputHTML.addEventListener('change', (e) => {
            file = e.target.files[0];
            blob = window.URL.createObjectURL(file);

            createImageHTML(blob)
        })
      }
    };

    document.getElementById('item-image').addEventListener('change', function(e){
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);

        createImageHTML(blob);
    });
  });
}
