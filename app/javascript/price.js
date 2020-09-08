function unit_price() {

  const InputNumber = document.getElementById("item-number")

  InputNumber.addEventListener('input', function() {

    const Price = document.getElementById("item-price").value;
    const Number = InputNumber.value;

    const UnitPrice = Math.round((Price / Number)*10)/10
    
    document.getElementById("item-unit-price").value = UnitPrice
  })

}
window.addEventListener('load', unit_price)