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

  def tf(key)
    tf = TextFragment.find(:first, :conditions => {:key => key})
    return RedCloth.new(tf.value).to_html if tf
    return "Text missing: [#{key}]"
  end

  def format_date(date)
    date.strftime("%b, %d %Y")
  end

  def format_date_range(start_date, end_date)
    "#{start_date.strftime("%b, %d %Y")} - #{end_date.strftime("%b, %d %Y")}"
  end

end
