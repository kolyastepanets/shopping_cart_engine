# require 'rails_helper'

# module ShoppingCart
#   RSpec.describe CartsController, type: :controller do
#     routes { ShoppingCart::Engine.routes }

#     let(:book) { create(:book) }
#     let(:book2) { create(:book) }
#     let!(:order_item) { create(:shopping_cart_order_item, product: book) }
#     let!(:order_item2) { create(:shopping_cart_order_item, product: book2) }
#     let!(:order) { create(:shopping_cart_order, order_items: [order_item, order_item2]) }
#     let!(:coupon) { create(:shopping_cart_coupon) }
#     let!(:other_coupon) { create(:shopping_cart_coupon, name: "new_year") }

#     before { allow(controller).to receive(:current_user).and_return(false) }
#     # before { allow(ApplicationController).to receive(:set_order).and_return(order) }

#     describe 'GET #show' do
#       before { get :show, id: order }

#       it 'assigns order to @order' do
#         # byebug
#         expect(assigns(:order)).to eq order
#       end

#       it 'renders show view' do
#         expect(response).to render_template :show
#       end
#     end

#     describe 'PATCH #update' do

#       context "updating quantity" do

#         before { allow(controller).to receive(:updating_coupon).and_return(false) }

#         it "changes the order_item's quantity" do
#           patch :update, id: order_item, order_id: order, items: { order_item.id => { quantity: 2 } }
#           expect(assigns(:order)).not_to be_nil
#         end

#         it 'redirect to order' do
#           patch :update, id: order_item, items: { order_item.id => { quantity: 2 } }
#           expect(response).to redirect_to cart_path
#         end
#       end

#       context "updating coupon" do

#         before { allow(controller).to receive(:updating_quantity).and_return(false) }

#         it "updates cart if coupon is valid" do
#           patch :update, id: order, order: { "coupon_attributes"=>{"name"=>"blackfriday"} }
#           expect(order.coupon).not_to be_nil
#         end

#         it "uses another coupon" do
#           patch :update, id: order, order: { "coupon_attributes"=>{"name"=>"new_year"} }
#           expect(order.coupon.name).to eq "new_year"
#         end

#         it "does nothing if params empty" do
#           patch :update, id: order, order: { "coupon_attributes"=>{"name"=>""} }
#           expect(order.coupon).to be_nil
#         end

#         it "does nothing if coupon is invalid" do
#           patch :update, id: order, order: { "coupon_attributes"=>{"name"=>"bla"} }
#           expect(order.coupon).to be_nil
#         end

#       end
#     end

#     describe 'DELETE #destroy' do
#       before { order }

#       it 'deletes order' do
#         expect { delete :destroy, id: order }.to change(Order, :count).by(-1)
#       end

#       it 'redirect to book path' do
#         delete :destroy, id: order
#         expect(response).to redirect_to books_path
#       end
#     end
#   end
# end
