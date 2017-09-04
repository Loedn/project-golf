class PaymentsController < ApplicationController
  before_action :set_order

  def new
  end

  def create
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
    )
  @event = Event.find(params[:event_id])
  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @order.amount_cents,
    description:  "Payment for Booking #{@order.sku} for order #{@order.id}",
    currency:     @order.amount.currency
    )

  @order.update(payment: charge.to_json, status: 'paid')
  redirect_to event_path(@event)
  @event.update(balance: @event.balance_cents - @order.amount_cents)
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end



private

  def set_order
    @order = Order.find(params[:order_id])
    authorize @order
  end
end
