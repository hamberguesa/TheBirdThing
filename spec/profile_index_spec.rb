require_relative 'spec_helper'

rack_env = {session: {}, flash: {}}
describe "profile index controller" do
  it "should let users log in" do
    u = User.create( username: "frank888", password: "blah", email: "llkdsjfkljlkjsdaf@lkdd.com", name: "ldskjfdsa")
    params = {username: "frank888", password: "blah"}
    post '/login', params, rack_env
    expect(last_request.env['rack.session']['user_id']).to eq u.id
    u.delete
  end
end
