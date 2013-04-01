module Constants
  TERM = YAML.load_file("#{Rails.root}/config/constants/term.yml")

  def TERM.index_by_name(name)
    item = self['terms'].find do |item|
      item['name'] == name
    end

    item['id'] if item
  end
end
