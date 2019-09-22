#Using factory pattern design principle to create

module PageObjectHelper
  @@page_object_cache = {}

  def get_page_object(page_name, index = 0)
    sleep rand(2..4)
    page_name = page_name.split.map(&:capitalize).join('')
    logger.info("Page Object Name: #{page_name}")
    return @@page_object_cache[page_name] if @@page_object_cache[page_name]
    begin
      page_object = eval("#{page_name}.new()")
    rescue NameError
      raise 'Please enter valid api name'
    end

    @@page_object_cache[page_name] = page_object
    page_object
  end

  def report_output(message)
    Kernel.puts message
    OUTPUT.putc("<PRE>#{message}</PRE>")
  end

end

World(PageObjectHelper)