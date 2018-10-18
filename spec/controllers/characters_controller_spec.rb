require 'rails_helper'

RSpec.describe CharactersController, type: :controller do

    before(:each) do
        @foo = Character.find_or_create_by(name: 'foo', hp: 1, attack: 1, armor: 1, background: 'nope')
        @params = {name: 'foobar', hp: 2, attack: 1, armor: 1, background: 'nope'}
        get :index
    end

    describe "GET characters#index" do
        it 'render a list of characters' do
            response.response_code.should == 200
        end
    end

    describe "GET characters#show" do
        it 'should show character' do
            get :show, params: { id: @foo.id }
            expect(response.status).to eq(200)
        end
    end

    describe "POST characters#create" do
        context "with valid attributes" do
            it "creates a new character" do
                prev_count = Character.count
                post :create, :params => { :character => @params }
                expect(Character.count).to eq(prev_count + 1)
            end
        end
    end

    describe "PUT characters#update" do
        it 'should update character' do
            put :update, params: { id: @foo.id, character: { name: 'bar'} }
            response.should redirect_to(:action => 'index')
        end
    end

end
