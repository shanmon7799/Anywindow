require 'rails_helper'

RSpec.describe "Comments", type: :request do
  # describe "GET /comments" do
  #   it "should be return windows json" do

  #     user = User.create!( email: "test@example.org", password: "12345678")

  #     get v1_window_comments_path
  #     data = {
  #         {
  #         “data” => {
  #               “comments”：{
  #               “comment_id”：1
  #               “content”：test
  #               “user_id”：1
  #               “username”：jackal
  #               }
  #           }
  #       }

  #     parsed_json = JSON.parse( response.body )

  #     expect(parsed_json).to eq(data)
  #   end
  # end

  # describe "POST /topics" do
  #   it "should save successfully" do
  #     post v1_window_comments_path(content: "AAA", window_id: 2)

  #     parsed_json = JSON.parse( response.body )

  #     expect( response.status ).to eq(200)
  #     expect( parsed_json ).to eq( {
  #       "comment_id" => Comments.last.id,
  #       "message" => "OK"
  #       })
  #   end

  #   it "should save failed" do
  #     post v1_window_comments_path

  #     parsed_json = JSON.parse( response.body )

  #     expect( response.status ).to eq(400)
  #   end
  # end

end
