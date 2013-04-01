class TermSetting < Settingslogic
  source "#{Rails.root}/config/constants/term.yml"

  class << self
    def index_by_name(name)
      item = self['terms'].find do |item|
        item['name'] == name
      end

      item['id'] if item
    end
  end
end