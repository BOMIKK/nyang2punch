class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
      if user.nil?
        can :read, :all
      elsif user.has_role? 'newbie'
        can [:read, :create], :all
        # Note에 대해 update과 destroy를 할 수 있는데 단 본인꺼만
        can [:update, :destroy], CatInfo, user_id: user.id
        can [:update, :destroy], Board, user_id: user.id
        can [:update, :destroy], Mom, user_id: user.id
      elsif user.has_role? 'admin'
        can [:read, :create, :update, :destroy], :all
      # else 
      #   # admin과 manager를 제외한 사람에 대한 권한
      #   can [:read, :create], :all
      #   # Note에 대해 update과 destroy를 할 수 있는데 단 본인꺼만
      #   can [:update, :destroy], Note, user_id: user.id
      end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
