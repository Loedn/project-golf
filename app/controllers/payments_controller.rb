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
    amount:      @event.balance_cents,
    description:  "Payment for Booking #{@order.sku} for order #{@order.id}",
    currency:     @order.amount.currency
    )

  @order.update(payment: charge.to_json, status: 'paid')
  redirect_to event_path(@event)
  @current_invite = @event.invites.find_by(user_id: current_user.id)
  @event.invites.each do |invite|
    invite.update(status: 'paid')
  end
  @event.update(balance: 0)
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end

  def split
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
    )
  @event = Event.find(params[:event_id])
  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @order.amount_cents / @event.invited_users.size ,
    description:  "Payment for Booking #{@order.sku} for order #{@order.id}",
    currency:     @order.amount.currency
    )

  @order.update(payment: charge.to_json, status: 'paid')
  redirect_to event_path(@event)
  @current_invite = @event.invites.find_by(user_id: current_user.id)
  @event.update(balance: @event.balance - (@order.amount / @event.invited_users.size))
  @current_invite.update(status: 'paid')
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
