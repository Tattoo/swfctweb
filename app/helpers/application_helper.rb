module ApplicationHelper
  
  def box(options = {}, &block)
    id = options[:id] || nil
    cssClasses = "box"
    cssClasses += " #{options[:cssClasses]}" if options[:cssClasses]
    style = options[:style_rules] || nil

    haml_tag :section, :id => id, :class => cssClasses, :style => style do
      haml_tag :section do
        block.call if block
      end
    end

  end

end
