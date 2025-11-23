# typed: false

module StripAttributes
  extend ActiveSupport::Concern

  class_methods do
    def strip_attributes(*attrs)
      before_save do
        attrs.each do |attr|
          value = send(attr)

          if value.respond_to?(:strip)
            send("#{attr}=", value.strip)
          end
        end
      end
    end
  end
end
