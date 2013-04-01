#-*- coding: utf-8 -*-
module CommentDecorator
  def body_with_time
    "#{body} (#{created_at})"
  end
end
