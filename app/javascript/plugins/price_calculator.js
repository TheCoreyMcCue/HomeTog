// const priceCalculator = () => {

//   const priceSumElement = document.getElementById('price-sum');

//   if (priceSumElement) {

//     const price = priceSumElement.dataset.price;

//     const date = document.getElementById('date');

//     startDateElement.addEventListener('input', updatePrice);
//     endDateElement.addEventListener('input', updatePrice);
//     function updatePrice(event) {
//       let date1 = new Date(startDateElement.value);
//       let date2 = new Date(endDateElement.value);
//       let diffTime = Math.abs(date2 - date1);
//       let diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
//       if (diffDays) {
//         priceSumElement.innerHTML = "Total: €" + parseFloat(diffDays * price)
//       } else {
//         priceSumElement.innerHTML = "Total: €" + parseFloat(price)
//       }
//     }
//   }
// }

// export { priceCalculator };
