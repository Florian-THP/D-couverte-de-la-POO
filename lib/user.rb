require "pry"

class User
  attr_accessor :email
  attr_accessor :age
  @@user_all = []



  def initialize(email_update, age_update)
    @email = email_update
    @age = age_update
    @@user_all << self
  end

  def self.all 
    return @@user_all
  end

  def self.find_by_email(mail)
    @@user_all.each do |user|
      if user.email == mail
        return user
      end
    end
  end
end


binding.pry