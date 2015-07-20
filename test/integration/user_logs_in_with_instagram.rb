require "test_helper"
class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = InstagramWorkshop::Application
    stub_omniauth
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "login"
    assert_equal "/", current_path
    assert page.has_content?("Ricky")
    assert page.has_link?("logout")
  end

  def stub_omniauth
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
      provider: 'instagram',
      extra: {
        raw_info: {
          user_id: "1234",
          name: "Horace",
          screen_name: "worace",
        }
      },
      credentials: {
        token: "pizza",
        secret: "secretpizza"
      }
    })
  end
end

#
# {"access_token":"262625892.9334989.d571eab1b79c4947a8e1cda5e2ada6d1",
#     "user":{"username":"brownieelf175",
#             "bio":"",
#             "website":"",
#             "profile_picture":"https:\/\/instagramimages-a.akamaihd.net\/profiles\/profile_262625892_75sq_1354494834.jpg",
#             "full_name":"Ricky Bacci",
#             "id":"262625892”}
# }
