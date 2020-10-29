function price() {
  const itemPrice = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  const tax = 0.1;

  itemPrice.addEventListener("input", () => {
    const inputValue = itemPrice.value;
    const includedTaxPrice = Math.floor(inputValue * tax);
    const finalPrice  = parseInt(inputValue) - parseInt(includedTaxPrice);
    if (isNaN(includedTaxPrice)){
      taxPrice.innerHTML = 0;
    } else {
      taxPrice.innerHTML = includedTaxPrice;
    };
    if (isNaN(finalPrice)){
      profit.innerHTML = 0;
    } else {
      profit.innerHTML = finalPrice;
    };
  });
};
window.addEventListener("load", price);
