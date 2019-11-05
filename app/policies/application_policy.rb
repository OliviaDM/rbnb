class ApplicationPolicy
  attr_reader :sucker, :record

  def initialize(sucker, record)
    @sucker = sucker
    @record = record
  end

  def index?
    false
  end

  def show?
    true
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :sucker, :scope

    def initialize(sucker, scope)
      @sucker = sucker
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
