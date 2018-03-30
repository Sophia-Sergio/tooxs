class Sp < ApplicationRecord
  belongs_to :store
  belongs_to :department

    def to_hour
    #busco la venta por hora del año anterior
    year  = self.year
    week  = self.week
    month = self.month
    dow   = self.dow

    historic_sale = Hs.where("year = #{year-1}").where("week = #{week}").where("month = #{month}").where("dow = #{dow}").first
    
    nine          = ( historic_sale[:nine].to_f / historic_sale[:total_day].to_f ) * self.sale.to_f
    ten           = ( historic_sale[:ten].to_f / historic_sale[:total_day].to_f ) * self.sale.to_f
    eleven        = ( historic_sale[:eleven].to_f / historic_sale[:total_day].to_f ) * self.sale.to_f
    twelve        = ( historic_sale[:twelve].to_f / historic_sale[:total_day].to_f ) * self.sale.to_f
    thirteen      = ( historic_sale[:thirteen].to_f / historic_sale[:total_day].to_f ) * self.sale.to_f
    fourteen      = ( historic_sale[:fourteen].to_f / historic_sale[:total_day].to_f ) * self.sale.to_f
    fifteen       = ( historic_sale[:fifteen].to_f / historic_sale[:total_day].to_f ) * self.sale.to_f
    sixteen       = ( historic_sale[:sixteen].to_f / historic_sale[:total_day].to_f ) * self.sale.to_f
    seventeen     = ( historic_sale[:seventeen].to_f / historic_sale[:total_day].to_f ) * self.sale.to_f
    eighteen      = ( historic_sale[:eighteen].to_f / historic_sale[:total_day].to_f ) * self.sale.to_f
    nineteen      = ( historic_sale[:nineteen].to_f / historic_sale[:total_day].to_f ) * self.sale.to_f
    twenty        = ( historic_sale[:twenty].to_f / historic_sale[:total_day].to_f ) * self.sale.to_f
    twenty_one    = ( historic_sale[:twenty_one].to_f / historic_sale[:total_day].to_f ) * self.sale.to_f
    twenty_two    = ( historic_sale[:twenty_two].to_f / historic_sale[:total_day].to_f ) * self.sale.to_f
    twenty_three  = ( historic_sale[:twenty_three].to_f / historic_sale[:total_day].to_f ) * self.sale.to_f

    hourly = {
      :nine => nine.to_i,
      :ten => ten.to_i,
      :eleven => eleven.to_i,
      :twelve => twelve.to_i,
      :thirteen => thirteen.to_i,
      :fourteen => fourteen.to_i,
      :fifteen => fifteen.to_i,
      :sixteen => sixteen.to_i,
      :seventeen => seventeen.to_i,
      :eighteen => eighteen.to_i,
      :nineteen => nineteen.to_i,
      :twenty => twenty.to_i,
      :twenty_one => twenty_one.to_i,
      :twenty_two => twenty_two.to_i,
      :twenty_three => twenty_three.to_i,
      :total  => (nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three).to_i
    }

    return hourly
    end

end


