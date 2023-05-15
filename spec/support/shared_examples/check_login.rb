RSpec.shared_examples "check login" do
  it "show flash danger please login" do
    expect(flash[:alert]).to eq I18n.t("devise.failure.unauthenticated")
  end

  it "redirect to login page when not logged in" do
    expect(response).to redirect_to("/users/sign_in")
  end
end
