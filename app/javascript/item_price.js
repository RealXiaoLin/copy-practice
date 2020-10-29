function price() {
  const itemPrice = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  const tax = 0.1;

  itemPrice.addEventListener("input", () => {
    const inputValue = itemPrice.value;
    const includedTaxPrice = Math.floor(inputValue * tax);
    taxPrice.innerHTML = includedTaxPrice;
    profit.innerHTML = parseInt(inputValue) + parseInt(includedTaxPrice);
  });
};
window.addEventListener("load", price);
