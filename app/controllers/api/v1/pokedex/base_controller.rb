module API
  module V1
    module Pokedex
      class BaseController < API::V1::BaseController
        def policy_scope(scope, policy_scope_class: nil, replace_parent_scope: false)
          super(replace_parent_scope ? scope : [:api, :pokedex, scope], policy_scope_class: policy_scope_class, replace_parent_scope: true)
        end

        def authorize(record, query = nil, policy_class: nil, replace_parent_scope: false)
          super(replace_parent_scope ? record : [:api, :pokedex, record], query, policy_class: policy_class, replace_parent_scope: true)
        end
      end
    end
  end
end
