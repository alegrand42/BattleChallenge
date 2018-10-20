require 'rails_helper'

RSpec.describe BattlesController, type: :controller do

    before(:each) do
        @foo = Character.find_or_create_by(name: 'foo', hp: 1, attack: 1, armor: 1, background: 'nope')
        @bar = Character.find_or_create_by(name: 'bar', hp: 1, attack: 1, armor: 1, background: 'nope')
        @foobar = Character.find_or_create_by(name: 'foobar', hp: 1, attack: 1, armor: 1, background: 'nope')
        @battle = Battle.find_or_create_by(player_one_id: @foo.id, player_two_id: @bar.id)
        @params = {player_one_id: @foo.id, player_two_id: @foobar.id}
        get :index
    end

    describe "GET battles#index" do
        it 'render a list of battles' do
            response.response_code.should == 200
        end
    end

    describe "GET battles#show" do
        it 'should show battle' do
            get :show, params: { id: @battle.id }
            expect(response.status).to eq(200)
        end
    end

    describe "POST battles#create" do
        context "with valid attributes" do
            it "creates a new battle" do
                prev_count = Battle.count
                post :create, :params => { :battle => @params }
                expect(Battle.count).to eq(prev_count + 1)
            end
        end
    end

    describe "PUT battles#update" do
        it 'should update battle' do
            put :update, params: { id: @battle.id, battle: { player_one_id: @foobar.id} }
            response.should redirect_to(:action => 'index')
        end
    end

end
