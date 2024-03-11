# 저자사진 + 설명 bullet list를 나란히 놓기 위한 div 블럭 생성
# Usage:
#   {% imgwlist %}
#   {% endimgwlist %}
module CustomBlock
  class ImgWithListTag < Liquid::Block
    def render(context)
      text = super
    end
  end
end
Liquid::Template.register_tag('imgwlist', CustomBlock::ImgWithListTag)
