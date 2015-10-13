module Easy
  module Matchers
    module Validations
      def validate_absence_of(*attributes)
        ValidateAbsenceOfMatcher.new(attributes)
      end

      class ValidateAbsenceOfMatcher < BaseValidationMatcher
        def initialize(attributes)
          super(attributes, :absence)
        end

        def matches?(subject)
          super(subject)

          matched_validator = class_name.validators.detect do |validator|
            validator.kind == type &&
              validator.attributes.sort == attributes.sort &&
              validator.options.sort == options.sort
          end

          true if matched_validator
        end

        def description
          "require #{ attributes.join(', ') } to not be set"
        end

        def with_message(message)
          options[:message] = message
          self
        end

        def if(&block)
          # block.call == options[:if].call

          raise NotImplementedError
        end

        def unless
          raise NotImplementedError
        end

        def on(context)
          options[:on] = context
          self
        end

        def allow_nil
          options[:allow_nil] = true
          self
        end

        def allow_blank
          raise NotImplementedError
        end

        def strict
          raise NotImplementedError
        end
      end
    end
  end
end
