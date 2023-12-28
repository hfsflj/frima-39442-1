document.addEventListener('DOMContentLoaded', function() {
  // 販売価格を入力する箇所の定義
  const inputPriceElement = document.getElementById('item-price');

  // 販売手数料と販売利益の表示要素の定義
  const addTaxPriceElement = document.getElementById('add-tax-price');
  const profitElement = document.getElementById('profit');

  // 入力された価格が変更されたときのイベントリスナー
  inputPriceElement.addEventListener('input', function() {
    const inputPrice = inputPriceElement.value;

    // 販売手数料と販売利益を計算
    const { fee, profit } = calculateFees(inputPrice);

    // 販売手数料と販売利益を表示する要素に結果をセット
    if (addTaxPriceElement && profitElement) {
      addTaxPriceElement.textContent = Math.floor(fee); // 小数点以下切り捨て
      profitElement.textContent = Math.floor(profit); // 小数点以下切り捨て
    }
  });

  function calculateFees(price) {
    // 入力された価格を取得
    const itemPrice = parseFloat(price);

    // 販売手数料を計算（10%）
    const fee = itemPrice * 0.1;

    // 販売利益を計算
    const profit = itemPrice - fee;

    return { fee, profit };
  }

  // 他の初期化コードなどがあればここに追加
});
