require 'hooks'

module Foosball
  module Concepts
    class Operation
      include Hooks
      include Hooks::InstanceHooks

      define_hook :on_success
      define_hook :on_errors

      private

      def run(observer:, &block)
        res, op = yield
        hook_method = (res) ? :on_success : :on_errors
        run_hook hook_method, observer, op
        [res, op]
      end
    end
  end
end
