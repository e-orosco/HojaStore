module ProductsHelper
  def currency_to_symbol(currency)
    currensies = {
      "PEN" => "PEN S/.",
      "USD"=> "USD $",
      "CLP"=> "CLP $", 
      "COP"=> "COP $" ,
      "ARS"=> "ARS $", 
      "BRL"=> "BRL R$"
    }
    currensies[currency]
  end
end
