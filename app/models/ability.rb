class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, [Category, Book, BookImage, User, Request]
    else
      [Review, Request, Comment, Like, Relationship, UsersBook].each do |item|
        can :manage, item do |object|
          user.send("#{item.underscore}s").include? object
        end
      end
    end
    can :read, :all
  end
end