module Defaultable
    extend ActiveSupport::Concern

    included do
        before_save :ensure_only_one_default
    end

    private
    def ensure_only_one_default
        return unless default
        
       self.class.where(user_id: user_id).where.not(id: id).update.all(default: false)
    end
end