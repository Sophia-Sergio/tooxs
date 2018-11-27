# frozen_string_literal: true

# Main dashboard controller
module Sodimac
  # Main dashboard controller
  class DashboardController < ApplicationController
    def index
      @setSellers = []
      @planVentaTotal = 0
      @ventaTotal = 0

      @sellers = Seller.where(department: 1, store:  1)
      @sellers.each do |seller|
        seller_plan = seller_staffing(seller, 5, 2018)
        plan = 0
        seller_plan.flatten.each_with_index do |plan_, index|
          plan += plan_[index + 1][:seller_plan_per_day].sum
        end

        sale = sale_real_per_seller(seller, 2018, 5)
        cumplimiento = ((sale.to_f / plan.to_f) * 100).round(2)
        @setSellers << { :seller => seller,
                  :sale => setNum(sale),
                  :plan => setNum(plan),
                  :cumplimiento => cumplimiento }
        @planVentaTotal += plan
        @ventaTotal += sale
      end
    end

    def sale_real_per_seller(seller,year,month)
        @dep   = seller.department.id
        SaleBySeller.where(month: month, seller: seller.id, department: @dep, year: year).sum("sale")
    end

    def production() end
  end
end
