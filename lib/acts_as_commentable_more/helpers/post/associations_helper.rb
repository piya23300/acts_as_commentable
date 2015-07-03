module ActsAsCommentableMore
  module Helpers
    module Post
      module AssociationsHelper

        private

        def post_define_role_based_inflection(role, association_comment_name)
          commantable_name = aacm_association_options[:as].to_sym
          send("define_role_based_inflection_#{Rails.version.first}", role, commantable_name, association_comment_name)
        end

        def define_role_based_inflection_3(role, commantable_name, association_comment_name)
          has_many "#{association_comment_name}".to_sym,
                   has_many_options(role).merge(:conditions => { role: role })
        end

        def define_role_based_inflection_4(role, commantable_name, association_comment_name)
          has_many "#{association_comment_name}".to_sym,
                   -> { includes(commantable_name, :user).where(role: role) },
                   has_many_options(role)
        end

        def has_many_options(role)
          { before_add: Proc.new { |post, comment| comment.role = role } }.merge(aacm_association_options)
        end

      end
    end
  end
end