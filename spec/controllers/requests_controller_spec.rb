require "rails_helper"

RSpec.describe RequestsController, type: :controller do
  let!(:company) {create :company}
  let!(:office) {create :office, company: company}

  describe "Show requests list GET requests#index" do
    let!(:user) {create :user, office: office}
    
    before{get :index}
    include_examples "check login"
    before{sign_in(user)}

    context "success when valid attributes" do
      let(:number_of_records) {Settings.spec.number_of_records_25}
      let!(:requests_list) {create_list(:request, number_of_records, user: user)}
      let(:items) {Settings.pagy.config.page.default}
      let(:current_page) {1}
      let(:start_page) {1}
      let(:pagy) {assigns(:pagy)}

      before{get :index}

      it "response have http status code 200(success)" do
        expect(response).to have_http_status :success
      end

      it "is expected to render template matcher index" do
        expect(response).to render_template(:index)
      end

      it "show recent requests by current user" do
        expect(assigns(:requests)).to eq user.requests.recent.limit items
      end

      it "check the number of records in one page" do
        expect(pagy.items).to eq items
      end

      it "check total number of records" do
        expect(pagy.count).to eq number_of_records
      end

      it "check current page" do
        expect(pagy.page).to eq current_page
      end

      it "check total number of pages" do
        expect(pagy.pages).to eq (number_of_records/items.to_f).ceil
      end

      it "check how much is the last page" do
        expect(pagy.last).to eq (number_of_records/items.to_f).ceil
      end

      it "index of the first record in the page (starting from 1)" do
        expect(pagy.from).to eq start_page
      end

      it "index of the last record in the page" do
        expect(pagy.to).to eq items
      end
    end
  end
end
