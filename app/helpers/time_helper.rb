# frozen_string_literal: true

module TimeHelper
  def format_date_time(datetime)
    datetime.strftime('%b %e, %Y @ %l:%M %p')
  end
end
