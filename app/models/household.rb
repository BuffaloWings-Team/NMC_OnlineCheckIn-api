# frozen_string_literal: true

require 'json'
require 'sequel'

module OnlineCheckIn
  # Models a household
  class Household < Sequel::Model
    many_to_one :owner, class: :'OnlineCheckIn::Account'

    many_to_many :collaborators,
                 class: :'OnlineCheckIn::Account',
                 join_table: :accounts_households,
                 left_key: :household_id, right_key: :collaborator_id

    one_to_many :members

    plugin :association_dependencies,
           members: :destroy,
           collaborators: :nullify

    plugin :timestamps
    plugin :whitelist_security
    set_allowed_columns :houseowner, :floorNo, :roomNo, :ping, :email, :phonenumber

    def to_h
      {
        type: 'household',
        attributes: {
          id:,
          houseowner:,
          floorNo:,
          roomNo:,
          ping:,
          email:,
          phonenumber:
        }
      }
    end

    def full_details
      to_h.merge(
        relationships: {
          owner:,
          collaborators:,
          members:
        }
      )
    end

    def to_json(options = {})
      JSON(to_h, options)
    end
  end
end
