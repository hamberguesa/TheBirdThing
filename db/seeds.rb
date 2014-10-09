require "faker"
class Seeds
  def self.run
    50.times do
      User.create(name: Faker::Name.name, username: Faker::Internet.user_name, password: "blah", email: Faker::Internet.email)
    end

    User.all.each do |user|
      10.times do
        r = user.relationships.new(followed_id: User.all.sample.id)
        r.save if Relationship.where(followed_id: r.followed_id, follower_id: r.follower_id).count == 0
        user.tweets.create(content: Faker::Lorem.sentence(2))
      end
    end
  end
end

Seeds.run
