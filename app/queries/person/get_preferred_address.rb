# frozen_string_literal: true

class Person
  class GetPreferredAddress < ApplicationQuery
    def initialize(person_id)
      @person_id = person_id
      super()
    end

    def call
      Address.where(person_id: @person_id, preferred: true).first
    end
  end
end
