require 'rails_helper'

module ShoppingCart
  RSpec.describe CartsController, type: :controller do
#     let(:user) { create(:user) }
#     let(:book) { create(:book) }
#     let(:book2) { create(:book) }
#     let!(:order_item) { create(:order_item, book: book) }
#     let!(:order_item2) { create(:order_item, book: book2) }
#     let!(:order) { create(:order, order_items: [order_item, order_item2], user: user) }
#     let!(:coupon) { create(:coupon) }
#     let!(:other_coupon) { create(:coupon, name: "new_year") }

#     describe 'GET #show' do
#       before { get :show, id: order, user: user }

#       it 'assigns order to @order' do
#         expect(assigns(:order)).to eq order
#       end

#       it 'renders show view' do
#         expect(response).to render_template :show
#       end
#     end

#     describe 'PATCH #update' do
#       before { allow(controller).to receive(:current_order).and_return(order) }

#       context "updating quantity" do

#         before { allow(controller).to receive(:updating_coupon).and_return(false) }

#         it "changes the order_item's quantity" do
#           # binding.pry
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
  end
end
