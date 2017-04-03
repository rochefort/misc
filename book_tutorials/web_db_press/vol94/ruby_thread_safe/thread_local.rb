# before
class Content
  class << self
    attr_accessor :adult
  end
end

# after
class Content
  class << self
    def adult=(boolean)
      Thread.current[:adult] = boolean
    end

    def adult
      Thread.current[:adult]
    end
  end
end
