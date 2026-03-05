function profit() {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return;

  priceInput.addEventListener("input", (e) => {
    const price = e.target.value
    const SellingFee = Math.floor(price * 0.1);
    const SalesProfit = price - SellingFee
    const AddTaxPrice = document.getElementById("add-tax-price");
    const bindPriceLogger = document.getElementById("profit");
    AddTaxPrice.innerHTML=  `${SellingFee}`
    bindPriceLogger.innerHTML = `${SalesProfit}`
  });
}

window.addEventListener("turbo:load", profit);
