module ApplicationHelper
  
  def box(options = {}, &block)
    id = options[:id] || nil
    cssClasses = "rounded"
    cssClasses += " #{options[:cssClasses]}" if options[:cssClasses]
    style = options[:style_rules] || nil

    haml_tag :section, :id => id, :class => cssClasses, :style => style do
      block.call if block
    end

  end

end
