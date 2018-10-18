module SharedSearchMethods
    extend ActiveSupport::Concern

    included do
        scope :search, -> (data) {
            unless data.blank?
                if self.has_attribute?(:name)
                    self.where("#{self.table_name}.name ILIKE :search", search: "%#{data}%")
                end
            end
        }
    end

    module ClassMethods
    end
end
