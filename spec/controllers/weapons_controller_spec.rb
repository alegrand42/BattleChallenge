require 'rails_helper'

RSpec.describe WeaponsController, type: :controller do

    before(:each) do
        @w = Weapon.find_or_create_by(name: 'sword', power: 1)
        @params = {name: 'shield', shield: 'true'}
        get :index
    end

    describe "GET weapons#index" do
        it 'render a list of weapons' do
            response.response_code.should == 200
        end
    end

    describe "GET weapons#show" do
        it 'should show weapon' do
            get :show, params: { id: @w.id }
            expect(response.status).to eq(200)
        end
    end

    describe "POST weapons#create" do
        context "with valid attributes" do
            it "creates a new weapon" do
                prev_count = Weapon.count
                post :create, :params => { :weapon => @params }
                expect(Weapon.count).to eq(prev_count + 1)
            end
        end
    end

    describe "PUT weapons#update" do
        it 'should update weapon' do
            put :update, params: { id: @w.id, weapon: { name: 'axe'} }
            response.should redirect_to(:action => 'index')
        end
    end

end
