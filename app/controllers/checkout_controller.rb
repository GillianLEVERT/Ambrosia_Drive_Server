

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
    success_url: 'http://localhost:5173?success=true',     
    cancel_url: 'http://localhost:5173?canceled=true',
  )
  session_url = session.url
  render json: { session_url: session_url }
  
end

end