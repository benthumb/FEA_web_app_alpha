require "~/Documents/sinatra_apps/kua/lib/FEA_alpha/Kua.rb"

class Person
  @profile # is this necessary : isn't it implicitly lodged here?
  include Kua
  attr_reader :profile

  def set_profile(profile)
    @profile = profile
    self.kua_init(@profile.birthdate, @profile.gender)
  end
end

class LoveInterest < Person
  attr_accessor :compatibility_score
  def is_compatible
    if compatibility_score >= 70
      thumbs_up = true
    else
      thumbs_up = false
    end
  end
end
