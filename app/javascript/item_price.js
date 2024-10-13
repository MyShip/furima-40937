const priceInput  = document.getElementById("item-price");
const addTaxDom   = document.getElementById("add-tax-price");
const salesProfit = document.getElementById("profit");

priceInput.addEventListener('input', () => {
  const inputValue = parseFloat(priceInput.value); // 入力値を数値に変換
  if (isNaN(inputValue) || inputValue < 300 || inputValue > 9999999) {
    addTaxDom.innerHTML = ''; // 無効な値の場合はクリア
    salesProfit.innerHTML = '';
    return;
  }
  const tax = Math.floor(inputValue * 0.1); // 販売手数料（10%）を計算
  addTaxDom.innerHTML = tax.toLocaleString(); // 小数点切り捨て、表示

  const profit = inputValue - tax; // 販売利益を計算
  salesProfit.innerHTML = profit.toLocaleString(); // 販売利益を表示
});


