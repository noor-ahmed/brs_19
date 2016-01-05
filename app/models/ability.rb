class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, [Category, Book, BookImage, User, Request]
    else      
      [Review, Request, Comment, Like, UsersBook].each do |item|
        can :manage, item do |object|
          user.send("#{item.underscore}s").include? object
        end
      end
      relationships = user.active_relationships + user.passive_relationships
      can :manage, Relationship do |relationship|
        relationships.include? relationship
      end
      can :create, [Review, Request, Comment, Like, Relationship, UsersBook]
    end
    can :read, :all
  end
end