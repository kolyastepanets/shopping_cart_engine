module ShoppingCart
  module ApplicationHelper
    def is_active?(action)
      "active-link" if step.to_s == action
    end

    def cc_years
      yrs = []
      year_today = Date.today.strftime("%Y").to_i
      year_today.upto(year_today+10).each { |y| yrs << y.to_s }
      return yrs
    end

    def cc_months
      ['01','02','03','04','05','06','07','08','09','10','11','12']
    end

    def hidden_number_card(order)
      num = order.credit_card.number.to_s
      "** ** ** " + num[-4..-1]
    end

    def month_and_year(order)
      month = order.credit_card.expiration_month.to_s
      year = order.credit_card.expiration_year.to_s
      month + "/" + year
    end
  end
end
