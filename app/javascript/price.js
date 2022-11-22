function price (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const tax = Math.floor(itemPrice.value * 0.1);
    const profit = Math.floor(itemPrice.value - tax);
    const taxPrice = document.getElementById("add-tax-price");
    const profitPrice = document.getElementById("profit");
    taxPrice.innerHTML = tax;
    profitPrice.innerHTML = profit;
  });
};

window.addEventListener('load', price);