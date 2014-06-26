module ApplicationHelper

  def http_url(url)
    if url.include?('http://')
      url
    else
      ('http://').concat(url)
    end
  end

  def show_time(d)
    d.strftime("at %H:%M, %F")
  end
end
