module TopsHelper
  def js_boo
    javascript_tag <<JS
var boo = #{@boo.to_json};
JS
  end
end
