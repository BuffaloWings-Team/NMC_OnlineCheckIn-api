# frozen_string_literal: true

module OnlineCheckIn
  # Add a collaborator to another owner's existing household
  class GetMemberQuery
    # Error for owner cannot be collaborator
    class ForbiddenError < StandardError
      def message
        'You are not allowed to access that member'
      end
    end

    # Error for cannot find a household
    class NotFoundError < StandardError
      def message
        'We could not find that member'
      end
    end

    # Member for given authenticated account
    def self.call(auth:, member:)
      raise NotFoundError unless member

      policy = MemberPolicy.new(auth[:account], member, auth[:scope])
      raise ForbiddenError unless policy.can_view?

      member
    end
  end
end
