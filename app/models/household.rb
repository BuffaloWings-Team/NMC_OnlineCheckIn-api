# frozen_string_literal: true

require 'json'
require 'sequel'

# rubocop:disable Style/HashSyntax

module OnlineCheckIn
  # Models a household
  class Household < Sequel::Model
    one_to_many :documents
    plugin :association_dependencies, documents: :destroy

    plugin :timestamps
    plugin :whitelist_security
    set_allowed_columns :owner, :floorNo, :contact
    # rubocop:disable Metrics/MethodLength
    def to_json(options = {})
      JSON(
        {
          data: {
            type: 'household',
            attributes: {
              id: id,
              owner: owner,
              floorNo: floorNo,
              contact: contact
            }
          }
        }, options
      )
    end
    # rubocop:enable Metrics/MethodLength
  end
end
# rubocop:enable Style/HashSyntax