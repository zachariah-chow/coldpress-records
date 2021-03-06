class OrdersController < ApplicationController
  def create
    Order.create(customer_email: params[:customer][:email], customer_full_name: params[:customer][:fullName], customer_billing_address: params[:customer][:billingAddress], customer_shipping_address: params[:customer][:shippingAddress], customer_country: params[:customer][:country], customer_phone: params[:customer][:phone], status: 0, delivery_method: params[:customer][:deliveryMethod], total_price: params[:total_price])

    params[:order].each do |order|
      OrderDetail.create(order_id: Order.last.id, product_option_id: order[:product_option_id], quantity: order[:quantity], unit_price: order[:price])
    end

    @cart.cart_details.destroy_all

    CustomerMailer.with(order_id: Order.last.id).confirm_order_email.deliver_now
    end

  def show
  end
end