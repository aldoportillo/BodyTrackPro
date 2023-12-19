class DateValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        unless value.is_a?(Date)
            record.errors.add(attribute, 'must be a valid date')
            return
          end
      
          if options[:past] && value > Date.today
            record.errors.add(attribute, 'must be in the past')
          end
      
          if options[:future] && value < Date.today
            record.errors.add(attribute, 'must be in the future')
          end
    end
  end
  