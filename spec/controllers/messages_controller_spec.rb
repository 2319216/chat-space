require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { build(:message) }
  let(:params) {{ group_id: group, message: attributes_for(:message) }}

  describe 'GET #index' do
    context 'ログインしている場合' do
      before do
        login_user user
        get :index, params: { group_id: group }
      end

      it "assigns the requested message to @messages" do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "assigns the requested message to @messages" do
        messages = group.messages
        expect(assigns(:messages)).to match(messages.sort{ |a, b| b.created_at <=> a.created_at } )
      end

      it "assigns the requested message to @messages" do
        expect(assigns(:group)).to eq group
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end

    context 'ログインしていない場合' do
      it "redirect_to new_user_session_path" do
        get :index, params: { group_id: group }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    context 'ログインしている場合' do
      before do
        login_user user
      end

      it "saves the new record in the DB" do
        expect{post :create, params}.to change(Message, :count).by(1)
      end

      it "not to saves the new record in the DB" do
        message = attributes_for(:message, message: nil, image: nil)
        expect{ post :create, params: {group_id: group, message: message} }.not_to change(Message, :count)
      end

      it "message save redirect_to group_messages_path" do
        post :create, params
        expect(response).to redirect_to group_messages_path
      end

      it "not to save renders the :index template" do
        message = attributes_for(:message, message: nil, image: nil)
        post :create, params:{group_id: group, message: message}
        expect(response).to render_template :index
      end
    end

    context 'ログインしていない場合' do
      it "renders the :index template" do
        post :create, params: { group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
