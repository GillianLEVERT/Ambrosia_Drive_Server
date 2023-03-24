class CheckoutController < ApplicationController
  before_action :authenticate_request!


def create

  total_price = @current_user.cart.total_price
  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [
      {
        price_data: {
          currency: 'eur',
          unit_amount: (total_price*100).to_i,
          product_data: {
            name: 'Rails Stripe Checkout',
          },
        },
        quantity: 1
      },
    ],
    mode: 'payment',
    success_url:  'https://ambrosiaserver.fly.dev/checkout?success=true',     
    cancel_url: 'https://ambrosiaserver.fly.dev/checkout?success=false',
  )
  session_url = session.url
  session_id = session.id 
  render json: { session_url: session_url, session_id: session_id }
  
end

def success
  session = Stripe::Checkout::Session.retrieve(params[:session_id])
  if @current_user.cart.cart_items.size >= 1 && session.payment_status == "paid"
    order = Order.create(user: @current_user)
    @current_user.cart.cart_items.destroy_all
    render json: order, status: :created
  else
    render json: { error: "Error in creating order" }, status: :unprocessable_entity
  end
end


end